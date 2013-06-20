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
    public class ValidationCourseController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /ValidationCourse/
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /ValidationCourse/
        [HttpPost]
        public ActionResult SearchStudent()
        {
            return View();
        }
        
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}