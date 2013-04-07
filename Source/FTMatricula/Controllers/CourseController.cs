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
    public class CourseController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        //
        // GET: /Course/ 

        public ActionResult index()
        {
            return View();
        }

        /// <summary>
        /// Paging Courses
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PagingCourses([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Courses.ToList().Select(m => new { m.CourseID, m.Code, m.Name, m.TeachingHours, m.Charge }).ToDataSourceResult(request));
        }

        /// <summary>
        /// Create Course
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CreateCourse([DataSourceRequest] DataSourceRequest request, Course model)
        {
            if (ModelState.IsValid)
            {
                model.CourseID = Guid.NewGuid();
                model.IsActive = true;
                model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                model.InsertDate = DateTime.Today;
                model.IpAddress = Network.GetIpAddress(Request);
                db.Courses.Add(model);
                db.SaveChanges();
            }
            return Json(new[] { new 
            { 
                CourseID = model.CourseID, 
                Code = model.Code, 
                Name = model.Name, 
                TeachingHours = model.TeachingHours, 
                Charge = model.Charge
            } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Update Course
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult UpdateCourse([DataSourceRequest] DataSourceRequest request, Course model)
        {
            model.IsActive = true;
            model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
            model.ModifyDate = DateTime.Today;
            model.IpAddress = Network.GetIpAddress(Request);
            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
            return Json(new[] { new 
            { 
                CourseID = model.CourseID, 
                Code = model.Code, 
                Name = model.Name, 
                TeachingHours = model.TeachingHours, 
                Charge = model.Charge
            } }.ToDataSourceResult(request, ModelState));
        }

        /// <summary>
        /// Destroy Course
        /// </summary>
        /// <param name="request"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Post)]
        [KendoAjaxErrorHandler]
        public ActionResult DestroyCourse([DataSourceRequest] DataSourceRequest request, Course model)
        {
            try
            {
                Course course = db.Courses.Find(model.CourseID);
                db.Courses.Remove(course);
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
    }
}