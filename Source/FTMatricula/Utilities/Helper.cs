using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

}