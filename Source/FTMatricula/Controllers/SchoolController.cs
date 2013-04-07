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
    public class SchoolController : Controller
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
        public ActionResult PagingSchools([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Schools.ToList().Select(m => new { m.SchoolID, m.Name, m.Description, m.Code }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateSchool([DataSourceRequest] DataSourceRequest request, School model)
        {
            if (ModelState.IsValid)
            {
                model.SchoolID = Guid.NewGuid();
                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                db.Schools.Add(model);
                db.SaveChanges();                
            }

            return Json(new[] { new { SchoolID = model.SchoolID, Name = model.Name, Description = model.Description, Code = model.Code } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateSchool([DataSourceRequest] DataSourceRequest request, School model)
        {
                model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                model.ModifyDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
                return Json(new[] { new { SchoolID = model.SchoolID, Name = model.Name, Description = model.Description, Code = model.Code } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        [KendoAjaxErrorHandler]
        public ActionResult DestroySchool([DataSourceRequest] DataSourceRequest request, School model)
        {
            try
            {
                School school = db.Schools.Find(model.SchoolID);
                db.Schools.Remove(school);
                db.SaveChanges();
                return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
            
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}