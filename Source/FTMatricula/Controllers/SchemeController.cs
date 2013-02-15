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
                Scheme scheme = new Scheme
                {
                    SchemeID = Guid.NewGuid(),
                    Name = model.SchemeName,
                    Description = model.Description,
                    OwnerUserId = new Guid(model.tmpOwnerUserId),
                    CoordinatorUserId = new Guid(model.tmpCoordinatorUserId),
                    ModalityID = new Guid(model.tmpModalityID),
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request),
                };
                Scheme_Requirement sReq = new Scheme_Requirement
                {
                    RequirementID = new Guid(model.tmpReqID),
                    SchemeID = scheme.SchemeID,
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request),
                };
                db.Schemes.Add(scheme);
                db.Scheme_Requirement.Add(sReq);
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
            scheme.ModalityID = new Guid(model.tmpModalityID);
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

        /// <summary>
        /// Create Requirements
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CreateRequirements([DataSourceRequest] DataSourceRequest request, Requirement model)
        {
            if (ModelState.IsValid)
            {
                model.RequirementID = Guid.NewGuid();
                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                db.Requirements.Add(model);
                db.SaveChanges();
            }
            return Json(new[] { new { ModalityID = model.RequirementID, Name = model.Name } }.ToDataSourceResult(request, ModelState));
        }

        public ActionResult Create()
        {
            return View();
        }
    }
}