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
    public class ModalityController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Modality/
        public ActionResult index()
        {
            return View();
        }

        //
        // GET: /Modality/
        public ActionResult View1()
        {
            return View();
        }

        /// <summary>
        /// Paging Modality
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingModality([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Types.Where(type => type.Usage == "MOD").ToList().Select(m => new { m.TypeID, m.Name, m.Description }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Update Modality
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateModality([DataSourceRequest] DataSourceRequest request, FTMatricula.Models.Type model)
        {
            if (String.IsNullOrEmpty(model.Name))
            {
                ModelState.AddModelError("Name", "Names is Required");
            }
            if (String.IsNullOrEmpty(model.Description))
            {
                ModelState.AddModelError("Period", "Period is Required");
            }

            if (ModelState.IsValid)
            {
                model.TypeID = Guid.NewGuid();
                model.Usage = "MOD";
                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                db.Types.Add(model);
                db.SaveChanges();               
            }            
            return Json(new[] { new { TypeID = model.TypeID, Name = model.Name, Description = model.Description } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Modality
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateModality([DataSourceRequest] DataSourceRequest request, FTMatricula.Models.Type model)
        {
            model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            model.ModifyDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            model.Usage = "MOD";
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();            
            return Json(new[] { new { TypeID = model.TypeID, Name = model.Name, Description = model.Description } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Modality
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyModality([DataSourceRequest] DataSourceRequest request, FTMatricula.Models.Type model)
        {
            FTMatricula.Models.Type modality = db.Types.Find(model.TypeID);
            db.Types.Remove(modality);           
            db.SaveChanges();                        
            return Json(new[] { new  {} }.ToDataSourceResult(request, ModelState));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}