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
        public ActionResult PagingScores([DataSourceRequest] DataSourceRequest request, string CourseID )
        {
            var uID = SessApp.GetUserID(User.Identity.Name);

            return Json(db.Scores
                        .Where(s => s.EnrollmentGroup.ProfessorID == uID && s.CourseID == new Guid(CourseID))
                        .Select(s => new
                        {
                            s.ScoreID,
                            UserName = s.Student.User.UserName,
                            FirstName = s.Student.FirstName,
                            LastName = s.Student.LastName,
                            s.Result

                        })
                        .ToDataSourceResult(request));
        }

        /// <summary>
        /// Create Score
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