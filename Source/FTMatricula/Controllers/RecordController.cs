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
    public class RecordController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();
        
        // GET: /Record/
        public ActionResult index()
        {
          return View();
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        /// <summary>
        /// Paging Records by Course
        /// </summary>
        [HttpPost]
        public ActionResult PagingScores([DataSourceRequest] DataSourceRequest request, string CourseID)
        {
            try
            {
                if (CourseID != null)
                {
                    var uID = SessApp.GetUserID(User.Identity.Name);

                    return Json(db.Records
                                .Where(s => s.Score.EnrollmentGroup.ProfessorID == uID && s.Score.CourseID == new Guid(CourseID))
                                .Select(s => new
                                {
                                    s.ScoreID,                                                                                                            
                                    UserName = s.Score.Student.User.UserName,
                                    FirstName = s.Score.Student.FirstName,
                                    LastName = s.Score.Student.LastName,
                                    Result = s.Score.Result                                    

                                })
                                .ToDataSourceResult(request));
                }
                else
                {
                    return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
                }
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
        }

    }
}