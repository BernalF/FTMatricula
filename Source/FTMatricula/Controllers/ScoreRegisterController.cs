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
        public ActionResult PagingScores([DataSourceRequest] DataSourceRequest request, string CourseID)
        {
            try
            {
                if ((CourseID != null) && (CourseID.Length > 0))
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
                                    s.Result

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
        /// Update Batch Method Score
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateScore([DataSourceRequest] DataSourceRequest request, [Bind(Prefix = "models")]IEnumerable<Score> scores)
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
                        if (double.TryParse(s.Result, out num))
                        {
                            string minScore = db.Courses
                                       .Where(m => m.CourseID == s.CourseID)
                                       .Select(m => m.ScoreCriteria.MinimumScore)
                                       .FirstOrDefault();

                            if (Convert.ToInt32(s.Result) < Convert.ToInt32(minScore))                            
                                s.isApproved = false;                            
                            else
                                s.isApproved = false;                            
                        }
                        else {
                            ModelState.AddModelError("", "Debe de insertar notas válidas (Números de 1 a 100).");
                            return Json(ModelState.ToDataSourceResult());
                        }
                    }
                    else
                    {
                        if (s.Result == null)
                        {
                            ModelState.AddModelError("", "No puede insertar una nota en blanco");
                            return Json(ModelState.ToDataSourceResult());
                        }
                        else if (s.Result == "R")                        
                            s.isApproved = false;                        
                        else if (s.Result == "A")                        
                            s.isApproved = true;                        
                    }
                    s.RecordResult = s.Result;
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
        /// Get Score Criteria By Plan
        /// </summary>
        [HttpPost]
        public JsonResult GetScoreCriteriaByPlan(string courseID)
        {
            return Json(
                db.ScoreCriterias
                .ToList()
                .Join(db.Courses, sc => sc.ScoreCriteriaID, c => c.ScoreCriteriaID, (sc, c) => new { sc, c })
                .Where(m => m.c.CourseID == new Guid(courseID))
                .Select(m =>
                new
                {
                    ScoreCriteria = Resources.GetValue(m.sc.Type.Name),
                    MinimumScore = (m.sc.MinimumScore == null) ? Resources.GetValue("APPROVED_REPPROVED_ALERT") : Resources.GetValue("MIN_SCORE_ALERT") + m.sc.MinimumScore
                }).FirstOrDefault());
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}