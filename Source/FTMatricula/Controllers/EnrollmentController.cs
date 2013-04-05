using FTMatricula.Models;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FTMatricula.Utilities.Helper;
using System.Data;
using System.Data.SqlTypes;

namespace FTMatricula.Controllers
{
    public class EnrollmentController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PagingEnrollments([DataSourceRequest] DataSourceRequest request)
        {
            var x = db.Enrollments
                    .ToList().Select(m => new
                    {
                        m.EnrollmentID,
                        m.Description,
                        PlanDescription = m.Plan.Description,
                        m.PlanID,
                        LocationName = m.Location.Name + " " + m.Location.Line1,
                        m.LocationID,
                        m.StartDate,
                        m.EndDate,
                        m.ExtraStartDate,
                        m.ExtraEndDate
                    })
                    ;
            return Json(x.ToDataSourceResult(request));
        }


        /// <summary>
        /// Create
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {

            return View(new Enrollment());
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Create(Enrollment model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    model.EnrollmentID = Guid.NewGuid();

                    model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                    model.InsertDate = DateTime.Today;
                    model.IpAddress = Network.GetIpAddress(Request);

                    db.Enrollments.Add(model);
                    db.SaveChanges();

                    var plan_courses = db.Plans.Where(p => p.PlanID == model.PlanID).ToList().FirstOrDefault().Plan_Course;

                    foreach (var plan_course in plan_courses)
                    {
                        var course = new EnrollmentCourse
                        {
                            EnrollmentCourseID = Guid.NewGuid(),
                            EnrollmentID = model.EnrollmentID,
                            CourseID = plan_course.CourseID,
                            IsChecked = false,
                            HasGroups = false,
                            InsertUserID = model.InsertUserID,
                            InsertDate = model.InsertDate,
                            IpAddress = model.IpAddress
                        };
                        db.EnrollmentCourses.Add(course);
                        db.SaveChanges();
                    }

                    return RedirectToAction("Index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        /// <summary>
        /// Save Selected Courses
        /// </summary>
        /// <param name="EnrollmentID"></param>
        /// <param name="EnrollmentCourses">[{EnrollmentCourseID,True/False}]</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveSelectedCourses(string EnrollmentID, string[] EnrollmentCourses)
        {
            try
            {
                var model = db.Enrollments.Where(x => x.EnrollmentID == new Guid(EnrollmentID))
                                                      .ToList()
                                                      .FirstOrDefault();

                foreach (var item in model.EnrollmentCourses)
                    item.IsChecked = false;
                if (EnrollmentCourses != null)
                    foreach (string EnrollmentCourseID in EnrollmentCourses)
                        model.EnrollmentCourses.Where(x => x.EnrollmentCourseID == new Guid(EnrollmentCourseID))
                                                .ToList()
                                                .FirstOrDefault().IsChecked = true;

                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();

                return Json("OK");
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        [HttpPost]
        public ActionResult SaveGroup(string EnrollmentCourseID, string ProfessorID, int Quota, string[] EnrollmentCourses)
        {
            try
            {
                EnrollmentGroup model = new EnrollmentGroup(); 
                model.EnrollmentGroupID = Guid.NewGuid();

                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);

                model.EnrollmentCourseID = new Guid(EnrollmentCourseID);
                model.ProfessorID = new Guid(EnrollmentCourseID);
                model.Quota = Quota;

                EnrollmentGroupSchedule schedule = new EnrollmentGroupSchedule();
                schedule.EnrollmentGroupScheduleID = Guid.NewGuid();
                schedule.EnrollmentGroupID = model.EnrollmentGroupID;
                schedule.InsertUserID= model.InsertUserID;
                schedule.InsertDate = model.InsertDate;
                schedule.IpAddress = model.IpAddress;

                //schedule.cl
                //schedule.DayOfWeek = DayOfWeek;
                //schedule.StartTime = StartTime;
                //schedule.EndTime = EndTime;
                

                //model.EnrollmentGroupSchedules.Add(

                //db.EnrollmentGroups.Add(model);
                db.SaveChanges();

                return Json("OK");
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Edit(Enrollment model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                    model.ModifyDate = DateTime.Today;
                    model.IpAddress = Network.GetIpAddress(Request);
                    db.Entry(model).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        /// <summary>
        /// Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(string id)
        {
            var model = db.Enrollments.Where(x => x.EnrollmentID == new Guid(id))
                                                      .ToList()
                                                      .FirstOrDefault();
            return View(model);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Groups(string id)
        {
            var model = db.Enrollments.Where(x => x.EnrollmentID == new Guid(id))
                                                      .ToList()
                                                      .FirstOrDefault();
            return View(model);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Courses(string id)
        {
            var model = db.Enrollments.Where(x => x.EnrollmentID == new Guid(id))
                                                      .ToList()
                                                      .FirstOrDefault();
            return View(model);
        }

    }
}
