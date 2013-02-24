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
    public class PlanController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Index PlanView/
        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Plan
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingPlan([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Plans.ToList().Select(m => new { m.PlanID, m.Name, m.Description, m.Version }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Create Plan
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreatePlan([DataSourceRequest] DataSourceRequest request, Plan model)
        {
            if (ModelState.IsValid)
            {
                model.PlanID = Guid.NewGuid();
                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                model.Version = Misc.GenerateVersion(model.PlanID);
                db.Plans.Add(model);
                db.SaveChanges();
            }

            return Json(new[] { new { PlanID = model.PlanID, Name = model.Name, Description = model.Description, model.Version } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Plan
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdatePlan([DataSourceRequest] DataSourceRequest request, Plan model)
        {
            model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            model.ModifyDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            //model.Version = Misc.GenerateVersion(model.PlanID);
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new[] { new { PlanID = model.PlanID, Name = model.Name, Description = model.Description, model.Version } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Plan
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyPlan([DataSourceRequest] DataSourceRequest request, Plan model)
        {
            Plan plan = db.Plans.Find(model.PlanID);
            db.Plans.Remove(plan);
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