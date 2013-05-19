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
            try
            {
                if (User.IsInRole("ROLE_SCHOOL_ADMIN"))
                {
                    Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);

                    return Json(db.Plans.ToList()
                           .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                           .Where(m => m.p.isActive == true
                               && m.sp.Scheme.SchoolID == schoolID)
                           .Select(m => new
                           {
                               SchemeID = m.sp.Scheme.SchemeID,
                               SchemeName = m.sp.Scheme.Name,
                               PlanID = m.p.PlanID,
                               PlanName = m.p.Name,
                               Description = m.p.Description,
                               Version = m.p.Version
                           }).ToDataSourceResult(request));
                }
                else
                {
                    return Json(db.Plans.ToList()
                              .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                              .Where(m => m.p.isActive == true)
                              .Select(m => new
                              {
                                  SchemeID = m.sp.Scheme.SchemeID,
                                  SchemeName = m.sp.Scheme.Name,
                                  PlanID = m.p.PlanID,
                                  PlanName = m.p.Name,
                                  Description = m.p.Description,
                                  Version = m.p.Version
                              }).ToDataSourceResult(request));
                }
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message, e.InnerException.InnerException);
            }

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
                model.isActive = true;
                model.hasEnrollment = false;
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
            model.isActive = true;
            model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            model.ModifyDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            model.Version = Misc.GenerateVersion(model.PlanID);
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
        [KendoAjaxErrorHandler]
        public ActionResult DestroyPlan([DataSourceRequest] DataSourceRequest request, Plan model)
        {
            try
            {
                db.Scheme_Plan
                  .ToList().RemoveAll(s => s.PlanID == model.PlanID);
                db.SaveChanges();

                Plan plan = db.Plans.Find(model.PlanID);
                db.Plans.Remove(plan);
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

        /// <summary>
        /// Create
        /// </summary>
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// Create Plan
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PlanDetail model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Scheme_Plan sPlan = new Scheme_Plan
                    {
                        SchemeID = model.SchemeID,
                        PlanID = Guid.NewGuid(),
                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request)
                    };
                    Plan plan = new Plan
                    {
                        PlanID = sPlan.PlanID,
                        Name = model.PlanName,
                        Description = model.Description,
                        Version = Misc.GenerateVersion(sPlan.PlanID),
                        isActive = true,
                        InsertUserID = SessApp.GetUserID(User.Identity.Name),
                        InsertDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                        Scheme_Plan = new HashSet<Scheme_Plan> { sPlan }
                    };
                    db.Plans.Add(plan);
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
                PlanDetail pDetail = db.PlanDetails
                                   .Where(s => s.PlanID == new Guid(id))
                                   .ToList()
                                   .FirstOrDefault();
                return View(pDetail);
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
        public ActionResult Edit(PlanDetail model)
        {
            try
            {
                Scheme_Plan sPlan = new Scheme_Plan
                {
                    SchemeID = model.SchemeID,
                    PlanID = model.PlanID,
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request)
                };
                Plan plan = new Plan
                {
                    PlanID = model.PlanID,
                    Name = model.PlanName,
                    Description = model.Description,
                    Version = Misc.GenerateVersion(sPlan.PlanID),
                    isActive = true,
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request),
                    Scheme_Plan = new HashSet<Scheme_Plan> { sPlan }
                };
                db.Entry(plan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("index");
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }
    }
}