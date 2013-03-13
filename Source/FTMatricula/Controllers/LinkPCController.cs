using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FTMatricula.Models;
using FTMatricula.Utilities.Helper;

namespace FTMatricula.Controllers
{
    public class LinkPCController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        /// <summary>
        /// index
        /// </summary>       
        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Get Courses List
        /// </summary>
        [HttpPost]
        public JsonResult GetCourses()
        {
            return Json(db.Courses.Where(c => c.IsActive == true).ToList().Select(c => new { c.CourseID, c.Code, c.Name }));
        }

        /// <summary>
        /// Get Courses by Plan
        /// </summary>
        [HttpPost]
        public JsonResult GetCoursesbyPlan(string planID)
        {
            return Json(from pc in db.Plan_Course
                        join c in db.Courses on pc.CourseID equals c.CourseID
                        where pc.PlanID == new Guid(planID)
                        select new { c.CourseID, c.Code, c.Name, pc.PlanID });
        }

        /// <summary>
        /// Get Courses List
        /// </summary>
        [HttpPost]
        public JsonResult InsertPlanCourse(string planID, string[] courses)
        {
            if (planID != "")
            {
                foreach (var item in courses)
                {
                    Plan_Course pc = new Plan_Course
                    {
                        PlanID = new Guid(planID),
                        CourseID = new Guid(item),
                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request)
                    };
                    db.Plan_Course.Add(pc);
                    db.SaveChanges();
                }
                return Json(true);
            }
            else
            {
                return Json("Error");
            }
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}