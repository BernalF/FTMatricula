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
using System.Text;

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
                                SchoolName = m.School == null ? "" : m.School.Name,
                                ScoreCriteriaType = m.ScoreCriteria == null ? "" : Resources.GetValue(m.ScoreCriteria.Type.Name),
                                ScoreCriteriaID = m.ScoreCriteriaID
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
                                SchoolName = m.School == null ? "" : m.School.Name,
                                ScoreCriteriaType = m.ScoreCriteria == null ? "" : Resources.GetValue(m.ScoreCriteria.Type.Name),
                                ScoreCriteriaID = m.ScoreCriteriaID
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
            Course model = new Course { ScoreCriteriaList = getScoreCriteriaList() };
            return View(model);
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
                        model.ScoreCriteriaID = Guid.NewGuid();
                        model.ScoreCriteria.ScoreCriteriaID = model.ScoreCriteriaID;
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

                course.ScoreCriteriaList = getScoreCriteriaList();
                
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
                    if (model.ScoreCriteriaID == null)
                    {
                        ScoreCriteria sc = new ScoreCriteria
                        {
                            ScoreCriteriaID = Guid.NewGuid(),
                            TypeID = model.ScoreCriteria.TypeID,
                            MinimumScore = model.ScoreCriteria.MinimumScore
                        };
                        model.ScoreCriteriaID = sc.ScoreCriteriaID;                        
                        db.ScoreCriterias.Add(sc);
                    }
                    else {
                        ScoreCriteria sc = new ScoreCriteria
                        {
                            ScoreCriteriaID = model.ScoreCriteriaID,
                            TypeID = model.ScoreCriteria.TypeID,
                            MinimumScore = model.ScoreCriteria.MinimumScore
                        };
                        db.Entry(sc).State = EntityState.Modified;
                    }
                    model.ScoreCriteria = null;
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
                ScoreCriteria sc = db.ScoreCriterias.Find(model.ScoreCriteriaID);
                db.Courses.Remove(course);
                db.ScoreCriterias.Remove(sc);
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

        private string getScoreCriteriaList()
        {
            StringBuilder result = new StringBuilder();
            result.Append("[ ");
            foreach (var t in db.Types
                                    .Where(x => x.Usage == "CSC")
                                    .ToList()
                                    .OrderBy(x => x.Name)
                                    .Select(x => new { x.TypeID, x.Name }).ToArray())
            {
                result.Append("{ \"name\": \"");
                result.Append(t.Name);
                result.Append("\" ,\"id\": \"");
                result.Append(t.TypeID);
                result.Append("\" },"); 
            }                    
            return result.ToString().Substring(0, (result.ToString().Length - 1)) + "]";
        }
    }
}