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
    public class UserController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();


        public ActionResult index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult PagingUsers([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.ApplicationUsers.ToList().Select(m => new { 
                m.StudentID, 
                m.UserName, 
                m.FirstName, 
                m.LastName, 
                RoleName = Resources.GetValue(m.RoleName), 
                m.Email,
                m.Phone1
            }).ToDataSourceResult(request));
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
                        ModelState.AddModelError("", "Error Insertando Usuario");
                        return View(model);
                    }

                    Roles.AddUserToRole(model.UserName, model.RoleName);

                    ApplicationUser user = db.ApplicationUsers.Where(x => x.UserName == model.UserName)
                                                      .ToList()
                                                      .FirstOrDefault();
                    Student student = new Student
                    {
                        StudentID = user.StudentID,
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
                        IsAppUser = true
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

        public ActionResult Edit(string id)
        {
            try
            {
                ApplicationUser user = db.ApplicationUsers.Where(x => x.StudentID == new Guid(id))
                                                      .ToList()
                                                      .FirstOrDefault();
                user.tmpUserName = user.UserName;
                return View(user);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        [HttpPost]
        public ActionResult Edit(ApplicationUser model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    
                    if (Roles.GetRolesForUser(model.tmpUserName).Length > 0)
                        Roles.RemoveUserFromRoles(model.tmpUserName, Roles.GetRolesForUser(model.tmpUserName));

                    if (!model.UserName.Equals(model.tmpUserName)) {
                        db.uspUserNameUpdate(model.tmpUserName, model.UserName);
                    }

                    Roles.AddUserToRole(model.UserName, model.RoleName);

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
                        IsAppUser = true
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
        [KendoAjaxErrorHandler]
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

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}