using FTMatricula.Models;
using FTMatricula.Utilities.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FTMatricula.Controllers
{
    public class CertificationsController : Controller
    {

        private matrifunDBEntities db = new matrifunDBEntities();

        /// <summary>
        /// Index Init
        /// </summary>
        /// <returns></returns>
        public ActionResult index()
        {
            return View(new CertificationsInit());
        }

        /// <summary>
        /// Index Init
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult index(CertificationsInit model)
        {
            switch (model.ServerRequest)
            {
                case "FIND_STUDENT":
                    this.Index_FIND_STUDENT(model);
                    break;
                case "START_PRINT":
                    return RedirectToAction("Print", "Certifications", routeValues: new { sID = model.Student.StudentID, pID = model.PlanID });
                default:
                    this.Index_DEFAULT(model);
                    break;
            }
            return View(model);
        }


        /// <summary>
        /// Index Init FIND_STUDENT
        /// </summary>
        /// <param name="model"></param>
        private void Index_FIND_STUDENT(CertificationsInit model)
        {
            List<EnrollStudent> result = null;
            if (model.Student.StudentID == null)
                result = db.Students.Where(x => x.User.UserName.Contains(model.Student.Identification)
                                         || x.FirstName.Contains(model.Student.FirstName)
                                         || x.LastName.Contains(model.Student.LastName)
                                         || x.Phone1.Contains(model.Student.Phone1)).Select(m => new EnrollStudent
                                         {
                                             StudentID = m.StudentID,
                                             Identification = m.User.UserName,
                                             FirstName = m.FirstName,
                                             LastName = m.LastName,
                                             Phone1 = m.Phone1
                                         }).ToList();
            else
            {
                result = new List<EnrollStudent>();

                var m = db.Students.Find(model.Student.StudentID);

                result.Add(new EnrollStudent
                {
                    StudentID = m.StudentID,
                    Identification = m.User.UserName,
                    FirstName = m.FirstName,
                    LastName = m.LastName,
                    Phone1 = m.Phone1
                });

            }

            if (result.Count == 1)
            {
                model.Student = new EnrollStudent
                {
                    StudentID = result[0].StudentID,
                    Identification = result[0].Identification,
                    FirstName = result[0].FirstName,
                    LastName = result[0].LastName,
                    Phone1 = result[0].Phone1
                };

                result = new List<EnrollStudent>();

                this.Check_StudentPlan(model);


            }
            model.StudentList = result;

        }


        /// <summary>
        /// Check StudentPlan
        /// </summary>
        /// <param name="model"></param>
        private void Check_StudentPlan(CertificationsInit model)
        {

            var r = db.StudentPlans.Where(x => x.PlanID == model.PlanID && x.StudentID == model.Student.StudentID).Select(x => x.PlanID).FirstOrDefault();
            if (r == null)
            {
                model.IsStudentOK = true;
                model.IsReadyToPrint = false;
                model.ServerRequest = null;


                model.Message = new ServerMessage
                {
                    Show = true,
                    Text = "El Estudiante no pertenece al plan seleccionado",
                    Severity = MessageSeverity.Error
                };
            }
            else
            {

                model.IsStudentOK = true;
                model.IsReadyToPrint = true;
                model.ServerRequest = null;


                model.Message = new ServerMessage
                {
                    Show = true,
                    Text = "Verificación de estudiante completado exitosamente, Proceso listo para generar Certificación...",
                    Severity = MessageSeverity.OK
                };
            }

        }

        /// <summary>
        /// Index Init DEFAULT
        /// </summary>
        /// <param name="model"></param>
        private void Index_DEFAULT(CertificationsInit model)
        {
            model.Student = new EnrollStudent();
            model.Message = new ServerMessage();
            model.IsReadyToPrint = false;
            model.IsStudentOK = false;

        }

        /// <summary>
        /// Print
        /// </summary>
        /// <param name="sID"></param>
        /// <param name="pID"></param>
        /// <returns></returns>
        public ActionResult Print(Guid sID, Guid pID)
        {

            Plan plan = db.Plans.Find(pID);
            Student student = db.Students.Find(sID);

            if ((plan != null) && (student != null))
            {
                string coordinatorName = "";
                User currentUser = db.Users.Where(x => x.UserName == User.Identity.Name).FirstOrDefault();
                if (currentUser != null)
                {
                    Student _currentUser = db.Students.Where(x => x.UserID == currentUser.UserId).FirstOrDefault();
                    if (_currentUser != null)
                    {
                        coordinatorName = _currentUser.FirstName + " " + _currentUser.LastName;
                    }
                }
                PDFCreator pdf = new PDFCreator();

                var courses = db.Plan_Course.Where(x => x.PlanID == plan.PlanID).Select(x => x.CourseID).ToList();
                var scores = db.Scores.Where(x => x.StudentID == student.StudentID && courses.Contains(x.CourseID)).Select(x => x.ScoreID).ToList();
                var records = db.Records.Where(x => scores.Contains(x.ScoreID)).Select(x => x.ScoreID).ToList();
                var final_scores = db.Scores.Where(x => records.Contains(x.ScoreID)).ToList();

                List<string[]> CoursesList = new List<string[]>();

                foreach (Score item in final_scores)
                {
                    CoursesList.Add(new string[] { 
                        item.Course.Code, 
                        item.Course.Name, 
                        item.RecordResult, 
                        item.Course.TeachingHours.ToString(), 
                        item.EnrollmentGroup.EnrollmentCourse.Enrollment.EndDate.Value.Month.ToString(), 
                        item.EnrollmentGroup.EnrollmentCourse.Enrollment.EndDate.Value.Year.ToString()});

                }

                string file = student.User.UserName + "_certification.pdf";
                pdf.BuildCertification(HttpContext.Server.MapPath("~/"),
                    file,
                    student.FirstName + " " + student.LastName,
                    student.User.UserName,
                    coordinatorName, plan.Name + " - " + plan.Description, CoursesList);

                ViewBag.PdfURL = "/certifications_downloads/" + file;
            }
            else
            {
                ViewBag.PdfURL = "";
            }
            return View();
        }

    }
}
