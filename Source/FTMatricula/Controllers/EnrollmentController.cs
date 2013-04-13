﻿using FTMatricula.Models;
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

        /// <summary>
        /// Save Group
        /// </summary>
        /// <param name="Group"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult SaveGroup(EnrollGroup Group)
        {
            try
            {
                EnrollmentGroup model = new EnrollmentGroup();
                model.EnrollmentGroupID = Guid.NewGuid();

                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);

                model.EnrollmentCourseID = new Guid(Group.EnrollmentCourseID);
                model.GroupName = Group.GroupName;
                model.ProfessorID = new Guid(Group.ProfessorID);
                model.Quota = Group.Quota;

                foreach (var item in Group.ScheduleList)
                {
                    EnrollmentGroupSchedule schedule = new EnrollmentGroupSchedule();
                    schedule.EnrollmentGroupScheduleID = Guid.NewGuid();
                    schedule.EnrollmentGroupID = model.EnrollmentGroupID;
                    schedule.InsertUserID = model.InsertUserID;
                    schedule.InsertDate = model.InsertDate;
                    schedule.IpAddress = model.IpAddress;

                    schedule.ClassroomID = new Guid(item.ClassroomID);
                    schedule.DayOfWeek = item.DayOfWeek;
                    schedule.StartTime = item.StartTime;
                    schedule.EndTime = item.EndTime;

                    model.EnrollmentGroupSchedules.Add(schedule);

                }

                db.EnrollmentGroups.Add(model);
                db.SaveChanges();

                return Json(true);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }


        /// <summary>
        /// Retrieve Groups
        /// </summary>
        /// <param name="EnrollmentID"></param>
        /// <param name="EnrollmentCourseID"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult RetrieveGroups(string EnrollmentID, string EnrollmentCourseID)
        {
            try
            {
                return Json(this.getGroupsList(EnrollmentID, EnrollmentCourseID));
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        /// <summary>
        /// Delete Group
        /// </summary>
        /// <param name="EnrollmentGroupID"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult DeleteGroup(string EnrollmentID, string EnrollmentCourseID, string EnrollmentGroupID)
        {
            try
            {
                EnrollmentGroup group = db.EnrollmentGroups.Find(new Guid(EnrollmentGroupID));

                foreach (var schedule in group.EnrollmentGroupSchedules.ToList())
                {
                    db.EnrollmentGroupSchedules.Remove(schedule);
                    db.SaveChanges();
                }
                db.EnrollmentGroups.Remove(group);
                db.SaveChanges();

                return Json(this.getGroupsList(EnrollmentID, EnrollmentCourseID));
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


        /// <summary>
        /// Enrollment
        /// </summary>
        /// <returns></returns>
        public ActionResult Enrollment(Guid sID, Guid eID)
        {
            Student student = db.Students.Find(sID);
            Enrollment enrollment = db.Enrollments.Find(eID);


            EnrollmentInfo model = new EnrollmentInfo();
            if (student != null)
                model.Student = new EnrollStudent
                {
                    Identification = student.User.UserName,
                    FirstName = student.FirstName,
                    LastName = student.LastName
                };
            if (enrollment != null)
            {
                model.EnrollmentID = enrollment.EnrollmentID;
                model.EnrollmentDescription = enrollment.Description;
                foreach (var c in enrollment.EnrollmentCourses.Where(x => x.IsChecked == true).ToList())
                {
                    IList<EnrollGroupDetail> groupsList = new List<EnrollGroupDetail>();
                    foreach (var g in c.EnrollmentGroups)
                    {
                        bool isFirst = true;
                        var professor = g.User.Students.Where(x => x.UserID == g.ProfessorID).FirstOrDefault();

                        foreach (var s in g.EnrollmentGroupSchedules)
                        {
                            if (isFirst)
                            {
                                isFirst = false;

                                groupsList.Add(new EnrollGroupDetail
                                {
                                    isFirst = true,
                                    EnrollmentGroupID = g.EnrollmentGroupID.ToString(),
                                    CourseCode = g.EnrollmentCourse.Course.Code,
                                    GroupName = g.GroupName,
                                    ClassroomCode = s.Classroom.Code,
                                    Schedule = s.DayOfWeek + "&nbsp;-&nbsp;" + s.StartTime + "&nbsp;" + s.EndTime,
                                    ProfessorName = professor.FirstName + "&nbsp;" + professor.LastName

                                });
                            }
                            else
                                groupsList.Add(new EnrollGroupDetail
                                {
                                    isFirst = false,
                                    EnrollmentGroupID = g.EnrollmentGroupID.ToString(),
                                    CourseCode = "&nbsp;",
                                    GroupName = "&nbsp;",
                                    ClassroomCode = s.Classroom.Code,
                                    Schedule = s.DayOfWeek + "&nbsp;-&nbsp;" + s.StartTime + "&nbsp;" + s.EndTime,
                                    ProfessorName = "&nbsp;"

                                });
                        }

                    }

                    model.EnrollmentCourses.Add(new EnrollCourse
                    {
                        CourseID = c.CourseID,
                        CourseName = c.Course.Code + " - " + c.Course.Name,
                        GroupsList = groupsList
                    });

                };
                model.PlanName = enrollment.Plan.Name + " " + enrollment.Plan.Description;

                //Guid? SchemeID = db.Scheme_Plan.Where(x => x.PlanID == e.Plan.PlanID).FirstOrDefault().SchemeID;
                //School school = db.School_Scheme.Where(x => x.SchemeID == SchemeID).FirstOrDefault().School;
                model.SchoolDescription = "-";//school.Code + " " + school.Description;
            }

            return View(model);
        }

        /// <summary>
        /// Save Enrollment
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public JsonResult SaveEnrollment(IList<EnrollStudentGroup> model)
        {

            try
            {
                foreach (var item in db.EnrollmentStudentCourses.Where(m => m.StudentID == new Guid(model[0].StudentID)).ToList())
                {
                    db.EnrollmentStudentCourses.Remove(item);
                    db.SaveChanges();
                }
                
                foreach (var item in model)
                {
                    db.EnrollmentStudentCourses.Add(new EnrollmentStudentCourse
                                                        {
                                                            EnrollmentStudentCourseID = Guid.NewGuid(),
                                                            EnrollmentGroupID = new Guid(item.EnrollmentGroupID),
                                                            StudentID = new Guid(item.StudentID),

                                                            InsertUserID = SessApp.GetUserID(User.Identity.Name),
                                                            InsertDate = DateTime.Today,
                                                            IpAddress = Network.GetIpAddress(Request)
                                                        });
                    db.SaveChanges();
                }
                

            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
            return Json(null);

        }


        /// <summary>
        /// Enrollment Init
        /// </summary>
        /// <returns></returns>
        public ActionResult EnrollmentInit()
        {
            return View(new EnrollmentInit());
        }

        /// <summary>
        /// Enrollment Init
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult EnrollmentInit(EnrollmentInit model)
        {
            switch (model.ServerRequest)
            {
                case "FIND_STUDENT":
                    this.EnrollmentInit_FIND_STUDENT(model);
                    break;
                case "START_ENROLL":
                    return RedirectToAction("Enrollment", "Enrollment", routeValues: new { sID = model.Student.StudentID, eID = model.EnrollmentID });
                default:
                    this.EnrollmentInit_DEFAULT(model);
                    break;
            }
            return View(model);
        }

        /// <summary>
        /// Enrollment Init FIND_STUDENT
        /// </summary>
        /// <param name="model"></param>
        private void EnrollmentInit_FIND_STUDENT(EnrollmentInit model)
        {
            List<EnrollStudent> result = null;
            if (model.Student.StudentID == null)
                result = db.Students.Where(x => x.User.UserName.Contains(model.Student.Identification)
                                         || x.FirstName.Contains(model.Student.FirstName)
                                         || x.LastName.Contains(model.Student.LastName)
                                         || x.Phone1.Contains(model.Student.Phone1)).Select(m => new EnrollStudent
                                         {
                                             StudentID = m.StudentID,
                                             Identification = m.User.UserName,
                                             FirstName = m.FirstName,
                                             LastName = m.LastName,
                                             Phone1 = m.Phone1
                                         }).ToList();
            else
            {
                result = new List<EnrollStudent>();

                var m = db.Students.Find(model.Student.StudentID);

                result.Add(new EnrollStudent
                {
                    StudentID = m.StudentID,
                    Identification = m.User.UserName,
                    FirstName = m.FirstName,
                    LastName = m.LastName,
                    Phone1 = m.Phone1
                });

            }

            if (result.Count == 1)
            {
                model.Student = new EnrollStudent
                                {
                                    StudentID = result[0].StudentID,
                                    Identification = result[0].Identification,
                                    FirstName = result[0].FirstName,
                                    LastName = result[0].LastName,
                                    Phone1 = result[0].Phone1
                                };

                model.IsStudentOK = true;
                model.Message = new ServerMessage
                                {
                                    Show = true,
                                    Text = "El Estudiante seleccionado esta verificado en la matrícula seleccionanda y es permitido proceder con dicho proceso",
                                    Severity = MessageSeverity.OK
                                };
                model.IsReadyToEnroll = true;
                model.ServerRequest = null;

                result = new List<EnrollStudent>();
            }
            model.StudentList = result;

        }
        /// <summary>
        /// Enrollment Init DEFAULT
        /// </summary>
        /// <param name="model"></param>
        private void EnrollmentInit_DEFAULT(EnrollmentInit model)
        {
            model.Student = new EnrollStudent();
            model.Message = new ServerMessage();
            model.IsReadyToEnroll = false;
            model.IsStudentOK = false;


        }


        /// <summary>
        /// Get Groups List
        /// </summary>
        /// <param name="EnrollmentID"></param>
        /// <param name="EnrollmentCourseID"></param>
        /// <returns></returns>
        private IList<EnrollGroupDetail> getGroupsList(string EnrollmentID, string EnrollmentCourseID)
        {
            try
            {
                var Groups = db.Enrollments.Where(x => x.EnrollmentID == new Guid(EnrollmentID))
                            .FirstOrDefault().EnrollmentCourses.Where(x => x.EnrollmentCourseID == new Guid(EnrollmentCourseID))
                                        .FirstOrDefault().EnrollmentGroups.ToList();

                IList<EnrollGroupDetail> result = new List<EnrollGroupDetail>();
                foreach (var group in Groups)
                {
                    var schedules = group.EnrollmentGroupSchedules.ToList();
                    var professor = group.User.Students.Where(x => x.UserID == group.ProfessorID).FirstOrDefault();
                    foreach (var schedule in schedules)
                    {

                        EnrollGroupDetail aux = new EnrollGroupDetail
                        {
                            EnrollmentGroupID = group.EnrollmentGroupID.ToString(),
                            CourseCode = group.EnrollmentCourse.Course.Code,
                            GroupName = group.GroupName,
                            ClassroomCode = schedule.Classroom.Code,
                            Schedule = schedule.DayOfWeek + " " + schedule.StartTime + " - " + schedule.EndTime,
                            ProfessorName = professor.FirstName + " " + professor.LastName
                        };
                        result.Add(aux);
                    }

                }

                return result;
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);

            }

        }

    }
}
