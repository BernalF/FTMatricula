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
                    .Join(db.Users, s => s.UserID, u => u.UserId, (s, u) => new { s, u })
                    .Where(m => m.s.UserID == m.u.UserId && m.s.IsAppUser == false)
                    .ToList().Select(m => new { m.u.UserId, m.s.StudentID, m.u.UserName, m.s.FirstName, m.s.LastName })
                    .ToDataSourceResult(request));
        }

        public ActionResult Create()
        {
            return View(new ApplicationUser { DateOfBirth = DateTime.Today });
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
                                    tmpUserName = x.tmpUserName
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
                throw new ApplicationException(e.Message);
            }
            //return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}