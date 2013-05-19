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
                    m.ModalityName,
                    m.SchoolName
                }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Destroy Scheme
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        [KendoAjaxErrorHandler]
        public ActionResult DestroyScheme([DataSourceRequest] DataSourceRequest request, SchemeDetail model)
        {
            try
            {
                Scheme scheme = db.Schemes.Find(model.SchemeID);
                foreach (var ss in scheme.School_Scheme.ToList())
                {
                    db.School_Scheme.Remove(ss);
                    db.SaveChanges();
                }

                db.Schemes.Remove(scheme);
                db.SaveChanges();

                return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }
        }

        /// <summary>
        /// Paging Requirements
        /// </summary>
        //[HttpPost]
        //public ActionResult PagingRequirements(string schemeID)
        //{
        //    return Json(db.Scheme_Requirement
        //        .Join(db.Requirements, sr => sr.RequirementID, r => r.RequirementID, (sr, r) => new { sr, r })
        //        .Where(s => s.sr.SchemeID == new Guid(schemeID))
        //        .ToList()
        //        .Select(s => s.r.Name));
        //}

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
            try
            {
                if (ModelState.IsValid)
                {
                    Guid schemeID = Guid.NewGuid();
                    // Insert in scheme
                    Scheme scheme = new Scheme
                    {
                        SchemeID = schemeID,
                        Name = model.SchemeName,
                        Description = model.Description,
                        OwnerUserId = model.OwnerUserId,
                        CoordinatorUserId = model.CoordinatorUserId,
                        ModalityID = model.ModalityID,
                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                    };
                    db.Schemes.Add(scheme);
                    db.SaveChanges();
                    
                    // Assign school to a scheme
                    School_Scheme ss = new School_Scheme { SchoolID = model.SchoolID, SchemeID = schemeID };
                    db.School_Scheme.Add(ss);
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
                Scheme scheme = db.Schemes.Find(model.SchemeID);
                foreach (var sss in scheme.School_Scheme.ToList())
                {
                    db.School_Scheme.Remove(sss);
                    db.SaveChanges();
                }

                if (model.SchoolID == null)
                {
                    ModelState.AddModelError("", "Por favor seleccione una Escuela");
                    SchemeDetail sd = db.SchemeDetails
                                   .Where(s => s.SchemeID == model.SchemeID)
                                   .ToList()
                                   .FirstOrDefault();
                    return View(sd);
                }
                else
                {
                    // Insert in scheme                    
                    db.Entry(scheme).State = EntityState.Modified;
                    db.SaveChanges();

                    // Assign school to a scheme
                    School_Scheme ss = new School_Scheme { SchoolID = model.SchoolID, SchemeID = model.SchemeID };
                    db.School_Scheme.Add(ss);
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
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