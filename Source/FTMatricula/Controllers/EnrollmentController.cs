using FTMatricula.Models;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FTMatricula.Controllers
{
    public class EnrollmentController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PagingEnrollments([DataSourceRequest] DataSourceRequest request)
        {
            var x = db.Enrollments
                    .ToList().Select(m => new { m.EnrollmentID, m.Description, /*m.Plan,*/ m.PlanID, /*m.Location,*/ m.LocationID, m.StartDate, m.EndDate, m.ExtraStartDate, m.ExtraEndDate })
                    ;
            return Json(x.ToDataSourceResult(request));
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {

            return View(new Enrollment());
        }

        /// <summary>
        /// Create
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Create(Enrollment model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    model.EnrollmentID = Guid.NewGuid();

                    db.Enrollments.Add(model);
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

    }
}
