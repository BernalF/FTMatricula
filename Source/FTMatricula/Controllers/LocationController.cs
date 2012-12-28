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
    public class LocationController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Location/

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
        public ActionResult PagingLocation([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Locations.ToList().Select(m => new { m.LocationID, m.Name, m.Line1, m.Line2}).ToDataSourceResult(request));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateLocation([DataSourceRequest] DataSourceRequest request, Location model)
        {
            model.LocationID = Guid.NewGuid();
            model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
            model.InsertDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            db.Locations.Add(model);
            db.SaveChanges();
            db.Entry(model).State = EntityState.Added;
            return Json(ModelState.ToDataSourceResult());
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateLocation([DataSourceRequest] DataSourceRequest request, Location model)
        {
            model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            model.ModifyDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
            return Json(ModelState.ToDataSourceResult());
        }

        /// <summary>
        /// Destroy Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyLocation([DataSourceRequest] DataSourceRequest request, Location model)
        {
            Location location = db.Locations.Find(model.LocationID);
            db.Locations.Remove(location);
            db.SaveChanges();
            db.Entry(model).State = EntityState.Deleted;
            return Json(ModelState.ToDataSourceResult());
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}