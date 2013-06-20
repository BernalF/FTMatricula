using FTMatricula.Models;
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

                model.IsStudentOK = true;
                model.IsReadyToPrint = true;
                model.ServerRequest = null;

                result = new List<EnrollStudent>();

                model.Message = new ServerMessage
                {
                    Show = true,
                    Text = "Verificación de estudiante completado exitosamente, Proceso listo para generar Certificación...",
                    Severity = MessageSeverity.OK
                };

                
            }
            model.StudentList = result;

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
            return View();
        }

    }
}
