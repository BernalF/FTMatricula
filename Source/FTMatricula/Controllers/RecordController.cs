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
    [KendoAjaxErrorHandler]
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
                if (CourseID != "" && CourseID != null)
                {
                    var uID = SessApp.GetUserID(User.Identity.Name);

                    var EnrollIdbyProf = db.EnrollmentGroups
                        .Where(m => m.ProfessorID == uID)
                        .Select(m => m.EnrollmentCourse)
                        .Select(m => m.Enrollment)
                        .OrderByDescending(m => m.InsertDate).ToList()
                        .Select(m => m.EnrollmentID)
                        .FirstOrDefault();


                    return Json(db.Scores
                                 .Where(s => s.CourseID == new Guid(CourseID) && s.EnrollmentGroup.EnrollmentCourse.EnrollmentID == EnrollIdbyProf)
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
                                    s.RecordResult

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
                double num = 0;
                foreach (var s in scores)
                {
                    if (db.Courses
                        .Where(m => m.CourseID == s.CourseID)
                        .Select(m => m.ScoreCriteria.MinimumScore)
                        .FirstOrDefault() != null)
                    {
                        if (double.TryParse(s.RecordResult, out num))
                        {
                            string minScore = db.Courses
                                       .Where(m => m.CourseID == s.CourseID)
                                       .Select(m => m.ScoreCriteria.MinimumScore)
                                       .FirstOrDefault();

                            if (Convert.ToInt32(s.RecordResult) < Convert.ToInt32(minScore))
                                s.isApproved = false;
                            else
                                s.isApproved = false;
                        }
                        else
                        {
                            ModelState.AddModelError("", "Debe de insertar notas válidas (Números de 1 a 100).");
                            return Json(ModelState.ToDataSourceResult());
                        }
                    }
                    else
                    {
                        if (s.RecordResult == null)
                        {
                            ModelState.AddModelError("", "No puede insertar una nota en blanco");
                            return Json(ModelState.ToDataSourceResult());
                        }
                        else if (s.RecordResult == "R")
                            s.isApproved = false;
                        else if (s.RecordResult == "A")
                            s.isApproved = true;
                    }
                    s.RecordResult = s.RecordResult;
                    s.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                    s.ModifyDate = DateTime.Today;
                    s.IpAddress = Network.GetIpAddress(Request);
                    db.Entry(s).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return Json(ModelState.ToDataSourceResult());
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
        }

        /// <summary>
        /// Send the notes to Records
        /// </summary>        
        [HttpPost]
        public JsonResult RecordAction(string CourseID)
        {
            try
            {
                if (CourseID != "")
                {
                    var uID = SessApp.GetUserID(User.Identity.Name);

                    foreach (var item in db.Scores
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
                            s.RecordResult

                        }).ToList())
                    {
                        db.Records.Add(new Record
                        {
                            RecordID = Guid.NewGuid(),
                            ScoreID = item.ScoreID,
                            InsertUserID = SessApp.GetUserID(User.Identity.Name),
                            InsertDate = DateTime.Today,
                            IpAddress = Network.GetIpAddress(Request)
                        });
                        db.SaveChanges();
                    }
                }
                return Json("true");
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
        }

        /// <summary>
        /// Validate if a course has already a record
        /// </summary>
        public JsonResult hasRecord(string CourseID)
        {
            try
            {
                var rs = from r in db.Records
                         join s in db.Scores on r.ScoreID equals s.ScoreID
                         where s.CourseID == new Guid(CourseID)
                         select new { r.RecordID };

                if (rs.ToList().Count > 0)
                    return Json(1);
                else
                    return Json(0);
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