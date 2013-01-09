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

namespace FTMatricula.Controllers
{
    [KendoAjaxErrorHandler]
    public class UserController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /User/

        public ActionResult index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PagingUsers([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.ApplicationUsers.ToList().Select(m => new { m.StudentID, m.UserName, m.FirstName, m.LastName }).ToDataSourceResult(request));
        }

        public ActionResult Create([DataSourceRequest] DataSourceRequest request, ApplicationUser model)
        {
            return View(model);
        }

        public ActionResult Edit([DataSourceRequest] DataSourceRequest request, ApplicationUser model)
        {
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