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
    public class SchoolController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Index SchoolView/
        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Users
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingSchools([DataSourceRequest] DataSourceRequest request)
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
        public ActionResult UpdateUsers([DataSourceRequest] DataSourceRequest request, UserModel model)
        {
            return Json("{}");
        }

        /// <summary>
        /// Destroy Users
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyUsers([DataSourceRequest] DataSourceRequest request, UserModel model)
        {
            return Json("{}");
        }

        //--------------------------------------------------------------------------------
        //------------------------- To rewrite and delete -------------------------------
        //--------------------------------------------------------------------------------
        //--------------------------------------------------------------------------------
        //
        // GET: /School/

        public ActionResult Index1()
        {
            return View(db.Schools.ToList());
        }

        //
        // GET: /School/Details/5

        public ActionResult Details(Guid? id)
        {
            School school = db.Schools.Find(id);
            if (school == null)
            {
                return HttpNotFound();
            }
            return View(school);
        }

        //
        // GET: /School/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /School/Create

        [HttpPost]
        public ActionResult Create(School school)
        {
            if (ModelState.IsValid)
            {

                school.SchoolID = Guid.NewGuid();
                school.IpAddress = Network.GetIpAddress(Request);
                school.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                school.InsertDate = DateTime.Today;

                db.Schools.Add(school);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(school);
        }

        //
        // GET: /School/Edit/5

        public ActionResult Edit(Guid? id)
        {
            School school = db.Schools.Find(id);
            if (school == null)
            {
                return HttpNotFound();
            }
            return View(school);
        }

        //
        // POST: /School/Edit/5

        [HttpPost]
        public ActionResult Edit(School school)
        {
            if (ModelState.IsValid)
            {
                db.Entry(school).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(school);
        }

        //
        // GET: /School/Delete/5

        public ActionResult Delete(Guid? id)
        {
            School school = db.Schools.Find(id);
            if (school == null)
            {
                return HttpNotFound();
            }
            return View(school);
        }

        //
        // POST: /School/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            School school = db.Schools.Find(id);
            db.Schools.Remove(school);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}