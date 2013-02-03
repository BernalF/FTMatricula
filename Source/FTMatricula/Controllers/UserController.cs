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
            return Json(db.ApplicationUsers.ToList().Select(m => new { m.StudentID, m.UserName, m.FirstName, m.LastName }).ToDataSourceResult(request));
        }

        public ActionResult Create()
        {
            return View(new ApplicationUser());
        }

        public ActionResult Edit(string id)
        {
            try
            {
                ApplicationUser user = db.ApplicationUsers.Where(x => x.StudentID == new Guid(id))
                                                      .ToList()
                                                      .FirstOrDefault();
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
            if (ModelState.IsValid)
            {
                if(Roles.GetRolesForUser(model.UserName).Length > 0)
                    Roles.RemoveUserFromRoles(model.UserName, Roles.GetRolesForUser(model.UserName));
                Roles.AddUserToRole(model.UserName,model.RoleName);

                Student user = new Student {
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
                    Phone1 = model.Phone1,
                    Phone2 = model.Phone2,
                    Phone3 = model.Phone3
                };

                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("index");
            }
            return View(model);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyUser([DataSourceRequest] DataSourceRequest request, ApplicationUser model)
        {
            ApplicationUser user = db.ApplicationUsers.Find(model.StudentID);
            db.ApplicationUsers.Remove(user);
            db.SaveChanges();
            return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}