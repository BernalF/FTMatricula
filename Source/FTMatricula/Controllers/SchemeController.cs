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
        /// Destroy Scheme
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyScheme([DataSourceRequest] DataSourceRequest request, SchemeDetail model)
        {
            try
            {
                db.Scheme_Requirement
                  .ToList().RemoveAll(s => s.SchemeID == model.SchemeID);
                db.SaveChanges();

                Scheme scheme = db.Schemes.Find(model.SchemeID);
                db.Schemes.Remove(scheme);
                db.SaveChanges();
                return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        /// <summary>
        /// Paging Requirements
        /// </summary>
        [HttpPost]
        public ActionResult PagingRequirements(string schemeID)
        {
            return Json(db.Scheme_Requirement
                .Join(db.Requirements, sr => sr.RequirementID, r => r.RequirementID, (sr, r) => new { sr, r })
                .Where(s => s.sr.SchemeID == new Guid(schemeID))
                .ToList()
                .Select(s => s.r.Name));
        }

        /// <summary>
        /// Create
        /// </summary>
        public ActionResult Create()
        {
            //var requirementsList = (from sd in db.SchemeDetails
            //                        join sr in db.Scheme_Requirement on sd.SchemeID equals sr.SchemeID
            //                        join r in db.Requirements on sr.RequirementID equals r.RequirementID
            //                        join t in db.Types on r.TypeID equals t.TypeID
            //                        where t.Usage == "REQ"
            //                        select new ReqDetailDTO { RequirementID = r.RequirementID, Name = r.Name }).AsEnumerable();

            //SchemeDetail schemeDetail = new SchemeDetail { requirements = requirementsList };
            //return View(schemeDetail);
            return View();
        }

        /// <summary>
        /// Create Scheme
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SchemeDetail model)
        {
            try
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
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
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
            try
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
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
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