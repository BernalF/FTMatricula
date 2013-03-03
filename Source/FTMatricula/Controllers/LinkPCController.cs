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
    public class LinkPCController : Controller
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
        /// Get Courses List
        /// </summary>
        [HttpPost]
        public JsonResult GetCourses() {
            return Json(db.Courses.Where(c => c.IsActive == true).ToList().Select(c => new { c.CourseID, c.Code, c.Name}));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}