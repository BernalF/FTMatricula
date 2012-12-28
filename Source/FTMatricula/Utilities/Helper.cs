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

            return getCacheResources()[key];
            
        }

        private static Dictionary<string, string> getCacheResources()
        {
            CacheStorageService cache = new CacheStorageService();
            object data = cache.GetData("GLOBAL_RESOURCES");

            if (data == null)
            {
                matrifunDBEntities db = new matrifunDBEntities();
                data = db.Resources.ToDictionary(k => k.ResourceKey, v => v.ResourceValue);
                cache.SetData("GLOBAL_RESOURCES", data, hours: 720);
            }
            return data as Dictionary<string, string>;
        }
    }


}