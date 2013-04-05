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
    public class ClassroomController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Index SchoolView/
        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Users
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingClassrooms([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Classrooms.ToList().Select(m => new { m.ClassroomID, m.Code, m.Description }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateClassrooms([DataSourceRequest] DataSourceRequest request, Classroom model)
        {
            if (ModelState.IsValid)
            {
                model.ClassroomID = Guid.NewGuid();
                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                db.Classrooms.Add(model);
                db.SaveChanges();                
            }
            return Json(new[] { new { ClassroomID = model.ClassroomID, Code = model.Code } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateClassrooms([DataSourceRequest] DataSourceRequest request, Classroom model)
        {
            model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            model.ModifyDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new[] { new { ClassroomID = model.ClassroomID, Code = model.Code } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyClassrooms([DataSourceRequest] DataSourceRequest request, Classroom model)
        {
            Classroom classroom = db.Classrooms.Find(model.ClassroomID);
            db.Classrooms.Remove(classroom);            
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