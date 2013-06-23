using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System.Web.Mvc;
using FTMatricula.Models;
using FTMatricula.Utilities.Helper;

namespace FTMatricula.Controllers
{
    public class ValidationCourseController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /ValidationCourse/
        public ActionResult Index()
        {
            return View(new ValidationCourseModel());
        }

        /// <summary>
        /// Index Init
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Index(ValidationCourseModel model)
        {
            switch (model.ServerRequest)
            {
                case "FIND_STUDENT":
                    this.Index_FIND_STUDENT(model);
                    break;
                case "START_VALIDATE":
                    return RedirectToAction("validation", "ValidationCourse", routeValues: new { sID = model.Student.StudentID, pID = model.PlanID });
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
        private void Index_FIND_STUDENT(ValidationCourseModel model)
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
        private void Check_StudentPlan(ValidationCourseModel model)
        {

            var r = db.StudentPlans.Where(x => x.PlanID == model.PlanID && x.StudentID == model.Student.StudentID).Select(x => x.PlanID).FirstOrDefault();
            if (r == null)
            {
                model.IsStudentOK = true;
                model.IsReadyToValidate = false;
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
                model.IsReadyToValidate = true;
                model.ServerRequest = null;
                model.Message = new ServerMessage
                {
                    Show = true,
                    Text = "Verificación de estudiante completado exitosamente, Proceso listo para Convalidar cursos...",
                    Severity = MessageSeverity.OK
                };
            }
        }

        /// <summary>
        /// Index Init DEFAULT
        /// </summary>
        /// <param name="model"></param>
        private void Index_DEFAULT(ValidationCourseModel model)
        {
            model.Student = new EnrollStudent();
            model.Message = new ServerMessage();
            model.IsReadyToValidate = false;
            model.IsStudentOK = false;

        }

        /// <summary>
        /// validation
        /// </summary>
        /// <param name="sID"></param>
        /// <param name="pID"></param>
        /// <returns></returns>
        public ActionResult validation(Guid sID, Guid pID)
        {
            ValidationCourseModel model = new ValidationCourseModel();


            TempData["sID"] = sID;
            TempData["pID"] = pID;

            model.PlanName = db.Plans.ToList().Where(m => m.PlanID == pID).Select(m => m.Name + " - " + m.Description + " - v. " + m.Version + " ").FirstOrDefault();
            model.StudentName = db.Students.ToList().Where(m => m.StudentID == sID).Select(m => m.FirstName + " " + m.LastName).FirstOrDefault();
            model.PlanID = pID;
            model.Student.StudentID = sID;
            return View(model);
        }

        /// <summary>
        /// Paging Courses
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingCourses([DataSourceRequest] DataSourceRequest request)
        {
            try
            {      
                Guid? StudentID = new Guid(TempData["sID"].ToString());
                Guid? PlanID = new Guid(TempData["pID"].ToString());

                return Json(db.Plan_Course.ToList()
                    .Join(db.Courses, pc => pc.CourseID, c => c.CourseID, (pc, c) => new { pc, c })
                    .Join(db.StudentPlans, a => a.pc.PlanID, b => b.PlanID, (a, b) => new { a, b })
                    .Where(w => w.a.pc.PlanID == PlanID && w.b.StudentID == StudentID)
                    .Select(m => new { CourseID = m.a.c.CourseID, Name = m.a.c.Name, Code = m.a.c.Code })
                    .Except(db.Plan_Course.ToList()
                    .Join(db.Courses, pc => pc.CourseID, c => c.CourseID, (pc, c) => new { pc, c })
                    .Join(db.StudentPlans, a => a.pc.PlanID, b => b.PlanID, (a, b) => new { a, b })
                    .Join(db.Scores, c => c.a.pc.CourseID, d => d.CourseID, (c, d) => new { c, d })
                    .Where(x => x.c.a.pc.PlanID == PlanID && x.c.b.StudentID == StudentID)
                    .Select(n => new { CourseID = n.c.a.c.CourseID, Name = n.c.a.c.Name, Code = n.c.a.c.Code }))
                    .ToDataSourceResult(request));
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        /// <summary>
        /// Validate Courses
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ValidateCourses(string studentID, string courseID, string reason) {
            try
            {
                Guid? StudentID = new Guid(studentID);                
                Guid? CourseID = new Guid(courseID);

                if (db.Courses
                        .Where(m => m.CourseID == CourseID)
                        .Select(m => m.ScoreCriteria.MinimumScore)
                        .FirstOrDefault() != null)
                {
                    string MinimumScore = db.Courses
                        .Where(m => m.CourseID == CourseID)
                        .Select(m => m.ScoreCriteria.MinimumScore)
                        .FirstOrDefault();

                    Score score = new Score {
                        ScoreID = Guid.NewGuid(),
                        StudentID = StudentID,
                        CourseID = CourseID,
                        isApproved = true,
                        Result = MinimumScore,
                        RecordResult = MinimumScore,
                        Reason = reason,
                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request)
                    };
                    db.Scores.Add(score);
                    db.Records.Add(new Record {
                        RecordID = Guid.NewGuid(),
                        ScoreID = score.ScoreID,
                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request)
                    });
                    db.SaveChanges();
                    return Json(new { result = "OK" });
                }
                else
                {
                    return Json(new { result = "El Curso no posee criterio de calificacion. No se pude Convalidar el curso" });
                }                
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

    }
}
