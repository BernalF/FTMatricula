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
        public JsonResult GetCourses(string planID)
        {
            bool? hasEnrollment = false;
            if (planID != null)
                hasEnrollment = db.Plans.Where(p => p.PlanID == new Guid(planID)).Select(p => p.hasEnrollment).FirstOrDefault();
            else
                hasEnrollment = false;

            Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);

            return Json(new
            {
                Courses = db.Courses
                            .Where(c => c.IsActive == true && c.SchoolID == schoolID)
                            .ToList()
                            .Select(c => new { c.CourseID, c.Code, c.Name }),
                hEnrollment = hasEnrollment
            });
        }

        /// <summary>
        /// Get Courses by Plan
        /// </summary>
        [HttpPost]
        public JsonResult GetCoursesbyPlan(string planID)
        {
            bool? hasEnrollment = false;
            if (planID != null)
                hasEnrollment = db.Plans.Where(p => p.PlanID == new Guid(planID)).Select(p => p.hasEnrollment).FirstOrDefault();
            else
                hasEnrollment = false;
            
            //SchoolID by PlanID
            Guid? schoolID = db.Plans
                .ToList()
                .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                .Where(m => m.p.PlanID == new Guid(planID)
                    && m.p.isActive == true)
                    .Select(m => m.sp.Scheme == null ? new Guid("") : m.sp.Scheme.SchoolID).FirstOrDefault();

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

            return Json(new { cUassigned = x, cAssigned = y, hEnrollment = hasEnrollment });
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