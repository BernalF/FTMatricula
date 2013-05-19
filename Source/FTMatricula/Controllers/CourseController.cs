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
            try
            {
                if (User.IsInRole("ROLE_SCHOOL_ADMIN"))
                {
                    Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);
                    return Json(db.Courses.ToList()
                        .Where(c => c.SchoolID == schoolID)
                        .Select(m =>
                            new
                            {
                                m.CourseID,
                                m.Code,
                                m.Name,
                                m.TeachingHours,
                                m.Charge,
                                SchoolName = m.School.Name
                            }).ToDataSourceResult(request));
                }
                else
                {
                    return Json(db.Courses
                        .ToList()
                        .Select(m =>
                            new
                            {
                                m.CourseID,
                                m.Code,
                                m.Name,
                                m.TeachingHours,
                                m.Charge,
                                SchoolName = m.School == null ? "" : m.School.Name
                            }).ToDataSourceResult(request));
                }
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        /// <summary>
        /// Create
        /// </summary>
        public ActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// Create Course
        /// </summary>
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Course model)
        {
            try
            {
                if (User.IsInRole("ROLE_SCHOOL_ADMIN"))
                {
                    if (ModelState.IsValid)
                    {
                        Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);
                        model.SchoolID = schoolID;
                        model.CourseID = Guid.NewGuid();
                        model.IsActive = true;
                        model.InsertUserID = SessApp.GetUserID(User.Identity.Name);
                        model.InsertDate = DateTime.Today;
                        model.IpAddress = Network.GetIpAddress(Request);
                        db.Courses.Add(model);
                        db.SaveChanges();
                        return RedirectToAction("index");
                    }
                    return View();
                }
                else
                {
                    ModelState.AddModelError("", "Solo administradores de escuela pueden agregar cursos");
                    return View();
                }
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
                Course course = db.Courses
                                   .Where(c => c.CourseID == new Guid(id))
                                   .ToList()
                                   .FirstOrDefault();
                return View(course);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        /// <summary>
        /// Edit Course
        /// </summary>        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(Course model)
        {
            try
            {
                if (User.IsInRole("ROLE_SCHOOL_ADMIN"))
                {
                    Guid? schoolID = Misc.GetSchoolID(User.Identity.Name);
                    model.SchoolID = schoolID;
                    model.IsActive = true;
                    model.ModifyUserID = SessApp.GetUserID(User.Identity.Name);
                    model.ModifyDate = DateTime.Today;
                    model.IpAddress = Network.GetIpAddress(Request);
                    db.Entry(model).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("index");
                }
                else
                {
                    ModelState.AddModelError("", "Solo administradores de escuela pueden agregar cursos");
                    Course course = db.Courses
                                   .Where(c => c.CourseID == model.CourseID)
                                   .ToList()
                                   .FirstOrDefault();
                    return View(course);                    
                }
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
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