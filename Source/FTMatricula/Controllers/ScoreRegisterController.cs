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
        /// Paging Score
        /// </summary>
        [HttpPost]
        public ActionResult PagingSchemes([DataSourceRequest] DataSourceRequest request)
        {
            var uID = SessApp.GetUserID(User.Identity.Name);

            return Json(db.Scores
                .Where(s => s.EnrollmentGroup.ProfessorID == db.Students
                                                                .Where(st => st.UserID == uID)
                                                                .Select(st => st.StudentID).FirstOrDefault())
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

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}