using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using FTMatricula.Utilities.Helper;
using FTMatricula.Models;

namespace FTMatricula.Controllers
{
    public class ScoreRegisterController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();
        
        // GET: /Index/
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Paging Scores by Course
        /// </summary>
        [HttpPost]
        public ActionResult PagingScores([DataSourceRequest] DataSourceRequest request, Score model)
        {
            var uID = SessApp.GetUserID(User.Identity.Name);

            return Json(db.Scores
                .Where(s => s.EnrollmentGroup.ProfessorID == db.Students
                                                                .Where(st => st.UserID == uID)
                                                                .Select(st => st.StudentID).FirstOrDefault()
                                                                && s.CourseID == model.CourseID)
                .Select(s => new
                {
                    s.ScoreID,
                    s.Student.User.UserName,
                    s.Student.FirstName,
                    s.Student.LastName,
                    s.Result

                })
                .ToDataSourceResult(request));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateScore([DataSourceRequest] DataSourceRequest request, Score model)
        {
            if (ModelState.IsValid)
            {
                //model.SchoolID = Guid.NewGuid();
                //model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                //model.InsertDate = DateTime.Today;
                //model.IpAddress = Network.GetIpAddress(Request);
                //db.Schools.Add(model);
                //db.SaveChanges();
            }
            return Json("");
            //return Json(new[] { new { SchoolID = model.SchoolID, Name = model.Name, Description = model.Description, Code = model.Code } }.ToDataSourceResult(request, ModelState));
        }
        
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}