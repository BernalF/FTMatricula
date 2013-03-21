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
            //List of Courses ID by Plan
            IQueryable<Guid?> lCourseID = from pc in db.Plan_Course
                                          join c in db.Courses on pc.CourseID equals c.CourseID
                                          where pc.PlanID == new Guid(planID)
                                          select c.CourseID;
            //List of Courses that did't Linked
            var x = from c in db.Courses
                    where !lCourseID.Contains(c.CourseID)
                    select new { c.CourseID, c.Code, c.Name };
            //List of Linked Courses
            var y = from pc in db.Plan_Course
                    join c in db.Courses on pc.CourseID equals c.CourseID
                    where pc.PlanID == new Guid(planID)
                    select new { c.CourseID, c.Code, c.Name, pc.PlanID };
            return Json(new { cUassigned = x, cAssigned = y });
        }

        /// <summary>
        /// Get Courses List
        /// </summary>
        [HttpPost]
        public JsonResult InsertPlanCourse(string planID, string[] courses)
        {
            if (planID != "")
            {
               // Delete all that exists
                var rows = from x in db.Plan_Course
                           where x.PlanID == new Guid(planID)
                           select x;
                foreach (var row in rows)
                {
                    db.Plan_Course.Remove(row);
                }
                db.SaveChanges();
                
                //Insert again
                if (courses != null)
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
                }
                return Json(true);
            }
            else
                return Json(false);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}