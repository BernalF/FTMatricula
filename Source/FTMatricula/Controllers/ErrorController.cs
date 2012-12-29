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
        ///  GET: /Error/
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }


        /// <summary>
        ///  GET: /Error404/
        /// </summary>
        /// <returns></returns>
        public ActionResult Error404()
        {
            return View();
        }

    }
}
