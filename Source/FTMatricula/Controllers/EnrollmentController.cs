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
using System.Text;
using System.Collections.ObjectModel;

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

            bool IsSchoolAdmin = User.IsInRole("ROLE_SCHOOL_ADMIN");
            Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);
            IList<Guid?> aux = IsSchoolAdmin ?
                                            db.Schemes.Where(x => x.SchoolID == schoolID).FirstOrDefault().Scheme_Plan.Select(p => p.PlanID).ToList()
                                            : new List<Guid?>();

            var enrollments = db.Enrollments
                    .Where(e=>IsSchoolAdmin == false || aux.Contains(e.PlanID))
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
            return Json(enrollments.ToDataSourceResult(request));
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

                    var plan = db.Plans.Find(model.PlanID);
                    if (plan != null) {

                        plan.hasEnrollment = true;

                        plan.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                        plan.ModifyDate = DateTime.Today;
                        plan.IpAddress = Network.GetIpAddress(Request);
                        db.Entry(plan).State = EntityState.Modified;
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

                    
                    var plan = db.Plans.Find(model.PlanID);
                    if (plan != null)
                    {

                        plan.hasEnrollment = true;

                        plan.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                        plan.ModifyDate = DateTime.Today;
                        plan.IpAddress = Network.GetIpAddress(Request);
                        db.Entry(plan).State = EntityState.Modified;
                        db.SaveChanges();
                    }

                    if (model.OldPlanID != model.PlanID)
                    {
                        int countEnrollsForOldPlanID = db.Enrollments.Where(x => x.PlanID == model.OldPlanID).Select(m => new { m.EnrollmentID }).ToList().Count;
                        if (countEnrollsForOldPlanID == 0)
                        {
                            plan = db.Plans.Find(model.OldPlanID);
                            plan.hasEnrollment = false;

                            plan.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                            plan.ModifyDate = DateTime.Today;
                            plan.IpAddress = Network.GetIpAddress(Request);
                            db.Entry(plan).State = EntityState.Modified;
                            db.SaveChanges();
                        }
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
        /// Edit
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(string id)
        {
            var model = db.Enrollments.Where(x => x.EnrollmentID == new Guid(id))
                                                      .ToList()
                                                      .FirstOrDefault();
            model.OldPlanID = model.PlanID;
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
            {
                model.Student = new EnrollStudent
                {
                    StudentID = student.StudentID,
                    Identification = student.User.UserName,
                    FirstName = student.FirstName,
                    LastName = student.LastName
                };
            }
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

                Guid? SchemeID = db.Scheme_Plan.Where(x => x.PlanID == enrollment.Plan.PlanID).FirstOrDefault().SchemeID;
                Scheme scheme = db.Schemes.Where(x => x.SchemeID == SchemeID).FirstOrDefault();
                model.SchoolDescription = scheme != null ? scheme.School.Code + " " + scheme.School.Description : "--";


                //pending test
                var enroll = db.Enrollments.Find(model.EnrollmentID);
                ICollection<Guid?> aux = new List<Guid?>();
                if (enroll != null)
                    aux = enroll.EnrollmentCourses.Select(m => m.EnrollmentCourseID).ToList();

                foreach (var studentCourse in db.EnrollmentStudentCourses.Where(m => m.StudentID == sID && aux.Contains(m.EnrollmentGroup.EnrollmentCourse.EnrollmentCourseID)).ToList())
                {
                    int i = 0;
                    StringBuilder rows = new StringBuilder();
                    var professor = studentCourse.EnrollmentGroup.User.Students.Where(x => x.UserID == studentCourse.EnrollmentGroup.ProfessorID).FirstOrDefault();

                    foreach (var group in studentCourse.EnrollmentGroup.EnrollmentGroupSchedules)
                    {
                        rows.Append("<li><p>");
                        rows.Append(i == 0 ? studentCourse.EnrollmentGroup.EnrollmentCourse.Course.Code + " - " + studentCourse.EnrollmentGroup.EnrollmentCourse.Course.Name : "&nbsp;");
                        rows.Append("</p></li>");

                        rows.Append("<li><p>");
                        rows.Append(i == 0 ? group.EnrollmentGroup.GroupName : "&nbsp;");
                        rows.Append("</p></li>");
                        rows.Append("<li><p>" + group.Classroom.Code + "</p></li>");
                        rows.Append("<li><p>" + group.DayOfWeek + " " + group.StartTime + " - " + group.EndTime + "</p></li>");
                        rows.Append("<li><p>");
                        rows.Append(i == 0 ? professor.FirstName + " " + professor.LastName : "&nbsp;");
                        rows.Append("</p></li>");
                        rows.Append("<li><p>");
                        rows.Append(i == 0 ? "<a href='#' class='delIcon' i='#INDEX#'></a>" : "&nbsp;");
                        rows.Append("</p></li>");
                        i++;
                    }

                    model.StudentCourses.Add(new EnrollStudentCourses
                    {
                        CourseID = studentCourse.EnrollmentGroup.EnrollmentCourse.CourseID,
                        EnrollmentGroupID = studentCourse.EnrollmentGroupID,
                        HTML = new HtmlString(rows.ToString())
                    });
                }
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
                if (model != null)
                {
                    string student = model[0].StudentID;
                    var studentCourses = db.EnrollmentStudentCourses.Where(m => m.StudentID == new Guid(student)).ToList();
                    foreach (var item in studentCourses)
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
        /// Enrollment Init
        /// </summary>
        /// <param name="EnrollmentID"></param>
        /// <param name="StudentID"></param>
        /// <param name="PaymentNumber"></param>
        /// <returns></returns>
        public JsonResult SaveEnrollmentPaymentInfo(Guid? EnrollmentID, Guid? StudentID, string PaymentNumber)
        {
            try
            {
                EnrollmentStudent aux = db.EnrollmentStudents.Where(m => m.EnrollmentID == EnrollmentID && m.StudentID == StudentID).FirstOrDefault();
                if (aux == null)
                {

                    db.EnrollmentStudents.Add(new EnrollmentStudent
                    {
                        EnrollmentStudentID = Guid.NewGuid(),
                        EnrollmentID = EnrollmentID,
                        StudentID = StudentID,
                        PaymentNumber = PaymentNumber,

                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                    });
                    db.SaveChanges();

                    foreach (var item in db.EnrollmentStudentCourses.Where(m => m.StudentID == StudentID).ToList())
                    {
                        db.Scores.Add(new Score
                        {
                            ScoreID = Guid.NewGuid(),
                            StudentID = StudentID,
                            EnrollmentGroupID = item.EnrollmentGroupID,
                            CourseID = item.EnrollmentGroup.EnrollmentCourse.CourseID,

                            InsertUserID = SessApp.GetUserID(User.Identity.Name),
                            InsertDate = DateTime.Today,
                            IpAddress = Network.GetIpAddress(Request)
                        });
                        db.SaveChanges();
                    }

                }
                else
                {
                    aux.PaymentNumber = PaymentNumber;
                    db.Entry(aux).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
            return Json(true);
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


                result = new List<EnrollStudent>();

                this.Check_StudentPlan(model);
                
            }
            model.StudentList = result;

        }


        /// <summary>
        /// Check StudentPlan
        /// </summary>
        /// <param name="model"></param>
        private void Check_StudentPlan(EnrollmentInit model)
        {
            Guid? planID = db.Enrollments.Find(model.EnrollmentID).PlanID;

            var r = db.StudentPlans.Where(x => x.PlanID == planID && x.StudentID == model.Student.StudentID).Select(x => x.PlanID).FirstOrDefault();
            if (r == null)
            {
                model.IsStudentOK = true;
                model.IsReadyToEnroll = false;
                model.ServerRequest = null;


                model.Message = new ServerMessage
                {
                    Show = true,
                    Text = "El Estudiante no pertenece al plan de estudios relacionado a la matrícula seleccionada.",
                    Severity = MessageSeverity.Error
                };
            }
            else
            {

                model.IsStudentOK = true;
                model.IsReadyToEnroll = true;
                model.ServerRequest = null;


                //pending test
                var enrollment = db.Enrollments.Find(model.EnrollmentID);
                ICollection<Guid?> aux = new List<Guid?>();
                if (enrollment != null)
                    aux = enrollment.EnrollmentCourses.Select(m => m.EnrollmentCourseID).ToList();

                var tmp = db.EnrollmentStudentCourses
                    .Where(m => m.StudentID == model.Student.StudentID && aux.Contains(m.EnrollmentGroup.EnrollmentCourse.EnrollmentCourseID)).ToList();
                if (tmp.Count > 0)
                {
                    model.Message = new ServerMessage
                    {
                        Show = true,
                        Text = "El Estudiante seleccionado posee cursos matriculados, se recomienda prudencia si continúa al editar dicha informacion",
                        Severity = MessageSeverity.Alert
                    };
                    model.AllowEnterPayNumber = true;
                }
                else
                {
                    model.Message = new ServerMessage
                    {
                        Show = true,
                        Text = "El Estudiante seleccionado esta verificado en la matrícula seleccionanda y es permitido proceder con dicho proceso",
                        Severity = MessageSeverity.OK
                    };
                }
            }

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
