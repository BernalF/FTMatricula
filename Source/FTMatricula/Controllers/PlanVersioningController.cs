using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FTMatricula.Models;

namespace FTMatricula.Controllers
{
    public class PlanVersioningController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        /// <summary>
        /// Versioning
        /// </summary>        
        public ActionResult Versioning()
        {
            return View();
        }

        /// <summary>
        /// Equivalences
        /// </summary>        
        public ActionResult Equivalences()
        {
            return View();
        }

        /// <summary>
        /// Generate New Version by PlanID
        /// </summary>
        /// <param name="planId"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult GenNewVersion(string planId) {
            return Json(Utilities.Helper.Misc.GenerateVersion(new Guid(planId)));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}