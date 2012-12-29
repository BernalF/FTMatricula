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

    }
}
