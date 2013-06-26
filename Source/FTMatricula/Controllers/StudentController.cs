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
using System.Web.Security;
using System.Text;

namespace FTMatricula.Controllers
{
    [KendoAjaxErrorHandler]
    public class StudentController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();


        public ActionResult index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult PagingUsers([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Students
                   .Join(db.utbMemberships, a => a.UserID, b => b.UserId, (a, b) => new { a, b })
                   .Where(m => m.a.UserID == m.b.UserId && m.a.IsAppUser == false)
                   .ToList().Select(m => new
                   {
                       m.a.User.UserId,
                       m.a.StudentID,
                       m.a.User.UserName,
                       m.a.FirstName,
                       m.a.LastName,
                       m.a.Phone1,
                       m.b.Email
                   })
                   .ToDataSourceResult(request));
        }


        public ActionResult Create()
        {
            var CountryID = db.Countries.Where(x => x.CountryName == "Costa Rica").FirstOrDefault().CountryID;
            return View(new ApplicationUser { DateOfBirth = DateTime.Today, CountryID = CountryID });
        }

        [HttpPost]
        public ActionResult Create(ApplicationUser model)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    MembershipCreateStatus createStatus;
                    Membership.CreateUser(model.UserName, model.UserName, model.Email, passwordQuestion: null, passwordAnswer: null, isApproved: true, providerUserKey: null, status: out createStatus);

                    if (createStatus != MembershipCreateStatus.Success)
                    {
                        ModelState.AddModelError("", "Error Insertando Estudiante");
                        return View(model);
                    }

                    Roles.AddUserToRole(model.UserName, "ROLE_STUDENT");

                    User user = db.Users.Where(x => x.UserName == model.UserName)
                                                      .ToList()
                                                      .FirstOrDefault();
                    Student student = new Student
                    {
                        StudentID = Guid.NewGuid(),
                        ModifyUserID = SessApp.GetUserID(User.Identity.Name),
                        ModifyDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                        UserID = user.UserId,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Gender = model.Gender,
                        DateOfBirth = model.DateOfBirth,
                        CountryID = model.CountryID,
                        MaritalStatusTypeID = model.MaritalStatusTypeID,
                        IdentificationTypeID = model.IdentificationTypeID,
                        Phone1 = model.Phone1,
                        Phone2 = model.Phone2,
                        Phone3 = model.Phone3,
                        IsAppUser = false
                    };

                    db.Students.Add(student);
                    db.SaveChanges();

                    return RedirectToAction("index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        public ActionResult EditPD(string id)
        {
            try
            {
                var x = db.Students
                    .Join(db.Users, s => s.UserID, u => u.UserId, (s, u) => new { s, u })
                    .Where(m => m.s.UserID == m.u.UserId && m.s.StudentID == new Guid(id))
                    .ToList().Select(m => new { m.u.UserId, m.s.StudentID, m.u.UserName, m.s.FirstName, m.s.LastName, m.s.DateOfBirth, m.s.Gender, m.s.MaritalStatusTypeID, m.s.CountryID, m.s.Phone1, m.s.Phone2, m.s.Phone3, tmpUserName = m.u.UserName })
                    .FirstOrDefault();

                MembershipUser aux = Membership.GetUser(x.UserName);


                return View(new ApplicationUser
                                {
                                    UserId = x.UserId,
                                    StudentID = x.StudentID,
                                    UserName = x.UserName,
                                    FirstName = x.FirstName,
                                    LastName = x.LastName,
                                    DateOfBirth = (DateTime)x.DateOfBirth,
                                    Gender = x.Gender,
                                    MaritalStatusTypeID = x.MaritalStatusTypeID,
                                    CountryID = x.CountryID,
                                    Phone1 = x.Phone1,
                                    Phone2 = x.Phone2,
                                    Phone3 = x.Phone3,
                                    tmpUserName = x.tmpUserName,
                                    Email = aux.Email
                                });
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        [HttpPost]
        public ActionResult EditPD(ApplicationUser model)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    if (Roles.GetRolesForUser(model.tmpUserName).Length > 0)
                        Roles.RemoveUserFromRoles(model.tmpUserName, Roles.GetRolesForUser(model.tmpUserName));

                    if (!model.UserName.Equals(model.tmpUserName))
                    {
                        db.uspUserNameUpdate(model.tmpUserName, model.UserName);
                    }

                    Roles.AddUserToRole(model.UserName, "ROLE_STUDENT");

                    MembershipUser aux = Membership.GetUser(model.UserName);
                    aux.Email = model.Email;
                    Membership.UpdateUser(aux);

                    Student user = new Student
                    {
                        StudentID = model.StudentID,
                        ModifyUserID = SessApp.GetUserID(User.Identity.Name),
                        ModifyDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                        UserID = model.UserId,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Gender = model.Gender,
                        DateOfBirth = model.DateOfBirth,
                        CountryID = model.CountryID,
                        MaritalStatusTypeID = model.MaritalStatusTypeID,
                        IdentificationTypeID = model.IdentificationTypeID,
                        Phone1 = model.Phone1,
                        Phone2 = model.Phone2,
                        Phone3 = model.Phone3,
                        IsAppUser = false
                    };

                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        public ActionResult EditAD(string id)
        {
            try
            {
                StudentAdditionalData x = db.StudentAdditionalDatas.Find(new Guid(id));
                if (x == null)
                    return View(new StudentAdditionalData { StudentID = new Guid(id) });
                else
                    return View(x);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        [HttpPost]
        public ActionResult EditAD(StudentAdditionalData model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    StudentAdditionalData tmp = db.StudentAdditionalDatas.Find(model.StudentID);
                    if (tmp != null)
                    {
                        tmp.PhysicalAddress = model.PhysicalAddress;
                        tmp.AdditionalAddress = model.AdditionalAddress;
                        tmp.Works = model.Works;
                        tmp.Studies = model.Studies;
                        tmp.WorkPlace = model.WorkPlace;
                        tmp.JobTitle = model.JobTitle;
                        tmp.WhoPaysYourStudiesTypeID = model.WhoPaysYourStudiesTypeID;
                        tmp.HowYouKnowAboutUsTypeID = model.HowYouKnowAboutUsTypeID;
                        tmp.ReceiveOffers = model.ReceiveOffers;
                        tmp.ReceiveNews = model.ReceiveNews;
                        db.Entry(tmp).State = EntityState.Modified;
                        db.SaveChanges();
                        model = tmp;
                    }
                    else
                    {
                        db.StudentAdditionalDatas.Add(model);
                        db.SaveChanges();
                    }
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        public ActionResult EditStudies(string id)
        {
            return View(new Student { StudentID = new Guid(id) });
        }


        [HttpPost]
        public ActionResult PagingStudies([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Students
                    .Join(db.Users, s => s.UserID, u => u.UserId, (s, u) => new { s, u })
                    .Where(m => m.s.UserID == m.u.UserId && m.s.IsAppUser == false)
                    .ToList().Select(m => new { m.u.UserId, m.s.StudentID, m.u.UserName, m.s.FirstName, m.s.LastName })
                    .ToDataSourceResult(request));
        }



        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyUser([DataSourceRequest] DataSourceRequest request, ApplicationUser model)
        {
            try
            {
                Student student = db.Students.Find(model.StudentID);
                if (student != null)
                {
                    db.Students.Remove(student);
                    db.SaveChanges();
                }

                if (Roles.GetRolesForUser(model.UserName).Length > 0)
                    Roles.RemoveUserFromRoles(model.UserName, Roles.GetRolesForUser(model.UserName));

                Membership.DeleteUser(model.UserName);
                return RedirectToAction("index");
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
            //return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Student Courses
        /// </summary>
        /// <returns></returns>
        public ActionResult StudentCourses()
        {
            return View();
        }

        /// <summary>
        /// Paging Student Courses
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingStudentCourses([DataSourceRequest] DataSourceRequest request)
        {
            List<StudentCourses> result = null;

            var temp = db.Students.Where(m => m.User.UserName == User.Identity.Name).FirstOrDefault();
            if (temp != null)
            {
                Guid? StudentID = temp.StudentID;

                var ScoresInRecords = db.Records.Where(m => m.Score.Student.StudentID == StudentID).Select(m => m.ScoreID).ToList();

                result = db.Scores
                                .Where(x => x.StudentID == StudentID && !ScoresInRecords.Contains(x.ScoreID))
                                .Select(m => new StudentCourses
                                    {
                                        EnrollmentGroupID = m.EnrollmentGroupID,
                                        ProfessorID = m.EnrollmentGroup.ProfessorID,
                                        CourseID = m.CourseID,
                                        CourseCode = m.Course.Code,
                                        CourseName = m.Course.Name,
                                        PlanCode = m.EnrollmentGroup.EnrollmentCourse.Enrollment.Plan.Name

                                    })
                                .ToList();
                int i = 0;
                foreach (var item in result)
                {
                    StringBuilder schedule = new StringBuilder();
                    foreach (var group in db.EnrollmentGroups.Find(item.EnrollmentGroupID).EnrollmentGroupSchedules)
                    {
                        if (schedule.Length == 0)
                            schedule.Append("" + group.Classroom.Code + " " + group.DayOfWeek + " " + group.StartTime + "-" + group.EndTime);
                        else
                            schedule.Append(" ; " + group.Classroom.Code + " " + group.DayOfWeek + " " + group.StartTime + "-" + group.EndTime);
                    }
                    result[i].Schedule = schedule.ToString();

                    var aux = db.Students.Where(x => x.UserID == item.ProfessorID).FirstOrDefault();
                    if (aux != null)
                        result[i].Professor = aux.FirstName + " " + aux.LastName;
                    i++;
                }
            }

            return Json(result.ToDataSourceResult(request));
        }

        /// <summary>
        /// Academic History
        /// </summary>
        /// <returns></returns>
        public ActionResult AcademicHistory()
        {
            return View();
        }

        /// <summary>
        /// Link Student Plan
        /// </summary>
        /// <returns></returns>
        public ActionResult LinkStudentPlan(string id)
        {
            try
            {
                Student x = db.Students.Find(new Guid(id));
                return View(x);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        /// <summary>
        /// Get Plans List
        /// </summary>
        [HttpPost]
        public JsonResult GetPlans(string studentID)
        {
            if (User.IsInRole("ROLE_SCHOOL_ADMIN"))
            {
                Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);

                return Json(new
                {
                    PlanLeft = db.Plans
                        .ToList()
                        .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                        .Where(m => m.p.isActive == true
                               && m.sp.Scheme.SchoolID == schoolID)
                        .Select(c =>
                      new
                      {
                          PlanID = c.p.PlanID,
                          PlanName = c.p.Name + " - " + c.p.Description + " - v. " + c.p.Version
                      })
                        .Except(db.StudentPlans
                        .ToList()
                        .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                        .Where(m => m.p.StudentID == new Guid(studentID) && m.sp.Plan.isActive == true
                               && m.sp.Scheme.SchoolID == schoolID)
                        .Select(m =>
                      new
                      {
                          PlanID = m.sp.PlanID,
                          PlanName = m.sp.Plan.Name + " - " + m.sp.Plan.Description + " - v. " + m.sp.Plan.Version
                      })),
                    //Plans that student belongs
                    PlanRigth = db.StudentPlans
                            .ToList()
                            .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                            .Where(m => m.sp.Plan.isActive == true
                               && m.sp.Scheme.SchoolID == schoolID && m.p.StudentID == new Guid(studentID))
                            .Select(m =>
                          new
                          {
                              PlanID = m.sp.PlanID,
                              PlanName = m.sp.Plan.Name + " - " + m.sp.Plan.Description + " - v. " + m.sp.Plan.Version
                          })
                });
            }
            else
            {
                return Json(new
                {
                    PlanLeft = db.Plans
                        .Where(c => c.isActive == true)
                        .ToList()
                        .Select(c =>
                      new
                      {
                          PlanID = c.PlanID,
                          PlanName = c.Name + " - " + c.Description + " - v. " + c.Version
                      })
                        .Except(db.StudentPlans
                        .ToList()
                        .Where(m => m.StudentID == new Guid(studentID))
                        .Select(m =>
                      new
                      {
                          PlanID = m.PlanID,
                          PlanName = m.Plan.Name + " - " + m.Plan.Description + " - v. " + m.Plan.Version
                      })),
                    //Plans that student belongs
                    PlanRigth = db.StudentPlans
                            .ToList()
                            .Where(m => m.StudentID == new Guid(studentID))
                            .Select(m =>
                          new
                          {
                              PlanID = m.PlanID,
                              PlanName = m.Plan.Name + " - " + m.Plan.Description + " - v. " + m.Plan.Version
                          })
                });
            }
        }

        /// <summary>
        /// Insert Plans Student
        /// </summary>
        [HttpPost]
        public JsonResult InsertPlanStudent(string studentID, string[] plans)
        {
            if (User.IsInRole("ROLE_SCHOOL_ADMIN"))
            {
                Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);

                // Delete all that exists by school
                var rows = from x in db.StudentPlans
                           join y in db.Scheme_Plan on x.PlanID equals y.PlanID
                           where x.StudentID == new Guid(studentID) && y.Scheme.SchoolID == schoolID
                           select x;

                foreach (var row in rows)
                {
                    db.StudentPlans.Remove(row);
                }
                db.SaveChanges();
                //Insert again
                if (plans != null)
                {
                    foreach (var item in plans)
                    {
                        StudentPlan sp = new StudentPlan
                        {
                            PlanID = new Guid(item),
                            StudentID = new Guid(studentID),
                            InsertUserID = SessApp.GetUserID(User.Identity.Name),
                            InsertDate = DateTime.Today,
                            IpAddress = Network.GetIpAddress(Request)
                        };
                        db.StudentPlans.Add(sp);
                        db.SaveChanges();
                    }
                }
                return Json(true);
            }
            else
            {
                // Delete all that exists
                var rows = from x in db.StudentPlans
                           where x.StudentID == new Guid(studentID)
                           select x;

                foreach (var row in rows)
                {
                    db.StudentPlans.Remove(row);
                }
                db.SaveChanges();
                //Insert again
                if (plans != null)
                {
                    foreach (var item in plans)
                    {
                        StudentPlan sp = new StudentPlan
                        {
                            PlanID = new Guid(item),
                            StudentID = new Guid(studentID),
                            InsertUserID = SessApp.GetUserID(User.Identity.Name),
                            InsertDate = DateTime.Today,
                            IpAddress = Network.GetIpAddress(Request)
                        };
                        db.StudentPlans.Add(sp);
                        db.SaveChanges();
                    }
                }
            }
            return Json(true);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}