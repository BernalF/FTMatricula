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
                throw new ApplicationException("The key '" + key + "' was not found. " + e.Message);
            }            
        }

        private static Dictionary<string,string> GetResources()
        {
            string culture = System.Threading.Thread.CurrentThread.CurrentUICulture.ToString();
            return new matrifunDBEntities().Resources.Where(p => p.Culture == culture).ToDictionary(k => k.ResourceKey, v => v.ResourceValue);
        }

    }


}