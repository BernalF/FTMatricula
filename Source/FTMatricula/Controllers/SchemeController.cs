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
    public class SchemeController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();
        //
        // GET: /Scheme/
        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Schemes
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingSchemes([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.SchemeDetails.ToList().Select(m =>
                new
                {
                    m.SchemeID,
                    m.SchemeName,
                    m.Description,
                    m.OwnerName,
                    m.CoordinatorName,
                    m.ModalityName
                }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Create Scheme
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateScheme([DataSourceRequest] DataSourceRequest request, SchemeDetail model)
        {
            if (ModelState.IsValid)
            {
                Scheme scheme = new Scheme();
                scheme.SchemeID = Guid.NewGuid();
                scheme.Name = model.SchemeName;
                scheme.Description = model.Description;
                scheme.OwnerUserId = model.OwnerUserId;
                scheme.CoordinatorUserId = model.CoordinatorUserId;
                scheme.ModalityID = new Guid(model.ModalityName);
                scheme.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                scheme.InsertDate = DateTime.Today;
                scheme.IpAddress = Network.GetIpAddress(Request);
                db.Schemes.Add(scheme);
                db.SaveChanges();
            }
            return Json(new[] { new 
            { 
                SchemeID = model.SchemeID, 
                SchemeName = model.SchemeName, 
                Description = model.Description, 
                OwnerName = model.OwnerName, 
                CoordinatorName = model.CoordinatorName,
                ModalityName = model.ModalityName
            } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Scheme
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateScheme([DataSourceRequest] DataSourceRequest request, SchemeDetail model)
        {
            Scheme scheme = new Scheme();            
            scheme.Name = model.SchemeName;
            scheme.Description = model.Description;
            scheme.OwnerUserId = model.OwnerUserId;
            scheme.CoordinatorUserId = model.CoordinatorUserId;
            //scheme.ModalityID = model.ModalityID;
            scheme.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            scheme.ModifyDate = DateTime.Today;
            scheme.IpAddress = Network.GetIpAddress(Request);
            db.Entry(scheme).State = EntityState.Modified;
            db.SaveChanges();            
            return Json(new[] { new 
            { 
                SchemeID = model.SchemeID, 
                SchemeName = model.SchemeName, 
                Description = model.Description, 
                OwnerName = model.OwnerName, 
                CoordinatorName = model.CoordinatorName,
                ModalityName = model.ModalityName
            } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Scheme
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyScheme([DataSourceRequest] DataSourceRequest request, SchemeDetail model)
        {
            Scheme scheme = db.Schemes.Find(model.SchemeID);
            db.Schemes.Remove(scheme);
            db.SaveChanges();
            return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        /// <summary>
        /// Paging Requirements
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingRequirements([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Requirements.ToList().Select(m =>
                new
                {
                    m.RequirementID,
                    m.Name
                }).ToDataSourceResult(request));
        }
    }
}