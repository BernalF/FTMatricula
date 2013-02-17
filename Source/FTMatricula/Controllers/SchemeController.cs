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

        /// <summary>
        /// index
        /// </summary>
        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Schemes
        /// </summary>
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
        /// Update Scheme
        /// </summary>
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
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyScheme([DataSourceRequest] DataSourceRequest request, SchemeDetail model)
        {
            Scheme scheme = db.Schemes.Find(model.SchemeID);
            db.Schemes.Remove(scheme);
            db.SaveChanges();
            return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Paging Requirements
        /// </summary>
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

        /// <summary>
        /// Create
        /// </summary>
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// Create Scheme
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SchemeDetail model)
        {
            if (ModelState.IsValid)
            {

                Scheme_Requirement sReq = new Scheme_Requirement
                {
                    RequirementID = new Guid(model.tmpReqID),
                    SchemeID = Guid.NewGuid(),
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request)
                };
                Scheme scheme = new Scheme
                {
                    SchemeID = sReq.SchemeID,
                    Name = model.SchemeName,
                    Description = model.Description,
                    OwnerUserId = model.OwnerUserId,
                    CoordinatorUserId = model.CoordinatorUserId,
                    ModalityID = model.ModalityID,
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request),
                    Scheme_Requirement = new HashSet<Scheme_Requirement> { sReq }
                };
                db.Schemes.Add(scheme);
                db.SaveChanges();
            }
            return RedirectToAction("index");
        }

        /// <summary>
        /// Edit
        /// </summary>
        public ActionResult Edit(string id)
        {
            try
            {
                SchemeDetail scheme = db.SchemeDetails
                                   .Where(s => s.SchemeID == new Guid(id))
                                   .ToList()
                                   .FirstOrDefault();
                return View(scheme);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        /// <summary>
        /// Edit Scheme
        /// </summary>        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(SchemeDetail model)
        {
            Scheme_Requirement sReq = new Scheme_Requirement
           {
               RequirementID = new Guid(model.tmpReqID),
               SchemeID = model.SchemeID,
               InsertUserID = SessApp.GetUserID(User.Identity.Name),
               InsertDate = DateTime.Today,
               IpAddress = Network.GetIpAddress(Request)
           };
            Scheme scheme = new Scheme
            {
                SchemeID = model.SchemeID,
                Name = model.SchemeName,
                Description = model.Description,
                OwnerUserId = model.OwnerUserId,
                CoordinatorUserId = model.CoordinatorUserId,
                ModalityID = model.ModalityID,
                InsertUserID = SessApp.GetUserID(User.Identity.Name),
                InsertDate = DateTime.Today,
                IpAddress = Network.GetIpAddress(Request),
                Scheme_Requirement = new HashSet<Scheme_Requirement> { sReq }
            };
            db.Entry(scheme).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("index");
        }

        /// <summary>
        /// Dispose
        /// </summary>
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}