using FTMatricula.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace FTMatricula.Utilities.Helper
{
    internal class Network
    {
        public static string GetIpAddress(HttpRequestBase request)
        {
            //return request.ServerVariables["REMOTE_ADDR"];
            return request.UserHostAddress;
        }
    }

    internal class SessApp
    {
        public static Guid GetUserID(string Username)
        {
            return (Guid)Membership.GetUser(Username).ProviderUserKey;
        }
    }

    internal class Misc
    {
        public static string GenerateVersion(Guid? PlanId)
        {
            matrifunDBEntities db = new matrifunDBEntities();
            int actYear = DateTime.Now.Year;
            string newVersion = "";
            
            var version = db.Plans
                            .Where(p => p.PlanID == PlanId)
                            .ToList()
                            .Select(p => p.Version)
                            .FirstOrDefault();

            if (version != null)
            {
                string[] oldVersion = version.Split(new string[] { "-" }, StringSplitOptions.None);                
                newVersion = actYear + "-" + (Convert.ToInt32(oldVersion[1]) + 1);
            }
            else {
                newVersion = actYear + "-" + 1;
            }
            return newVersion;
        }
    }

    public static class Resources
    {

        public static string GetValue(string key)
        {
            try
            {
                return new CacheStorageService().Get<Dictionary<string, string>>("LOCAL_RESOURCE", GetResources, hours: 720)[key];
            }
            catch (Exception e)
            {
                throw new ApplicationException("The given key '" + key + "' was not found. " + e.Message);
            }
        }

        private static Dictionary<string, string> GetResources()
        {
            string culture = System.Threading.Thread.CurrentThread.CurrentUICulture.ToString();
            return new matrifunDBEntities().Resources.Where(p => p.Culture == culture).ToDictionary(k => k.ResourceKey, v => v.ResourceValue);
        }

    }

    public class KendoAjaxErrorHandlerAttribute : FilterAttribute, IExceptionFilter
    {
        public void OnException(ExceptionContext filterContext)
        {
            filterContext.ExceptionHandled = true;
            filterContext.HttpContext.Response.StatusCode = 200;
            filterContext.Result = new JsonResult
            {
                Data = new
                {
                    Data = new { },
                    Total = 0,
                    Errors = new object[] 
                    { 
                        new { Exception = "Exception", errors = new[] { filterContext.Exception.Message.ToString() } },
                        new { Detail = "Detail", errors = new[] { 
                            "Source: " + filterContext.Exception.TargetSite.ToString().Replace(" ","+")
                             //System.Convert.ToBase64String(System.Text.Encoding.Unicode.GetBytes((filterContext.Exception.Source.ToString())))
                        } }
                    }
                },
                JsonRequestBehavior = JsonRequestBehavior.AllowGet
            };
        }
    }


}