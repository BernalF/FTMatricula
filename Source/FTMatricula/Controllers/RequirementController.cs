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
    public class RequirementController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Requirement/

        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Requirements
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingRequirements([DataSourceRequest] DataSourceRequest request)
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
        public ActionResult CreateRequirement([DataSourceRequest] DataSourceRequest request, RequirementDetail model)
        {
            if (ModelState.IsValid)
            {
                Requirement req = new Requirement
                {
                    RequirementID = Guid.NewGuid(),
                    Name = model.Name,
                    TypeID = model.TypeID,
                    InsertUserID = SessApp.GetUserID(User.Identity.Name),
                    InsertDate = DateTime.Today,
                    IpAddress = Network.GetIpAddress(Request)
                };

                db.Requirements.Add(req);
                db.SaveChanges();
            }

            return Json(new[] { new { RequirementID = model.RequirementID, Name = model.Name, TypeID = model.TypeID, TypeName = model.TypeName } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateRequirement([DataSourceRequest] DataSourceRequest request, RequirementDetail model)
        {

            Requirement req = new Requirement
            {                
                Name = model.Name,
                TypeID = model.TypeID,
                ModifyUserID = SessApp.GetUserID(User.Identity.Name),
                ModifyDate = DateTime.Today,
                IpAddress = Network.GetIpAddress(Request)
            };
            
            db.Entry(req).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new[] { new { RequirementID = model.RequirementID, Name = model.Name, TypeID = model.TypeID, TypeName = model.TypeName } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyRequirement([DataSourceRequest] DataSourceRequest request, RequirementDetail model)
        {
            Requirement req = db.Requirements.Find(model.RequirementID);
            db.Requirements.Remove(req);
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