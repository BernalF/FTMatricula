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

        /// <summary>
        /// Paging Records by Course
        /// </summary>
        [HttpPost]
        public ActionResult PagingRecords([DataSourceRequest] DataSourceRequest request, string CourseID)
        {
            try
            {
                if (CourseID != null)
                {
                    var uID = SessApp.GetUserID(User.Identity.Name);

                    return Json(db.Scores
                                .Where(s => s.EnrollmentGroup.ProfessorID == uID && s.CourseID == new Guid(CourseID))
                                .Select(s => new
                                {
                                    s.ScoreID,
                                    s.CourseID,
                                    s.EnrollmentGroupID,
                                    s.StudentID,
                                    UserName = s.Student.User.UserName,
                                    FirstName = s.Student.FirstName,
                                    LastName = s.Student.LastName,
                                    s.Result,
                                    FinalScore = s.Result

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

        /// <summary>
        /// Update Batch Method Record
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateRecord([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Score> scores)
        {
            try
            {
                foreach (var s in scores)
                {
                    
                }
                return Json(ModelState.ToDataSourceResult());
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
        }


        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}