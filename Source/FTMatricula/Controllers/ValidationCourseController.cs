using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FTMatricula.Models;

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

                model.IsStudentOK = true;
                model.IsReadyToValidate = true;
                model.ServerRequest = null;

                result = new List<EnrollStudent>();

                model.Message = new ServerMessage
                {
                    Show = true,
                    Text = "Verificación de estudiante completado exitosamente, Proceso listo para Convalidar Cursos...",
                    Severity = MessageSeverity.OK
                };


            }
            model.StudentList = result;

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

            model.PlanName = db.Plans.ToList().Where(m => m.PlanID == pID).Select(m => m.Name).FirstOrDefault();

            return View(model);
        }

    }
}
