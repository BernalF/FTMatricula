using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FTMatricula.Controllers
{
    public class ErrorController : Controller
    {
        /// <summary>
        ///  GET: /Error/E404
        /// </summary>
        /// <returns></returns>
        public ActionResult Error404()
        {
            Response.StatusCode = 404;
            Response.TrySkipIisCustomErrors = true;
            return View();
        }

        /// <summary>
        ///  GET: /Error/NotAuthorized
        /// </summary>
        /// <returns></returns>
        public ActionResult NotAuthorized()
        {
            //Response.StatusCode = 404;
            //Response.TrySkipIisCustomErrors = true;
            return View();
        }

        /// <summary>
        ///  GET: /Error/RediretToError
        /// </summary>
        /// <returns></returns>
        public ActionResult RediretToError(string e, string d)
        {
            TempData.Add("Exception", e);
            TempData.Add("Detail", d);
            return RedirectToAction("AjaxError", "Error");
        }

        /// <summary>
        ///  GET: /Error/AjaxError
        /// </summary>
        /// <returns></returns>
        public ActionResult AjaxError()
        {
            object e, d;
            TempData.TryGetValue("Exception", out e);
            TempData.TryGetValue("Detail", out d);
                
            ViewBag.Exception = e.ToString();
            ViewBag.Detail = d.ToString();
            return View();
        }



    }
}
