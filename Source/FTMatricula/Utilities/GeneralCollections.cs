using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace FTMatricula.Utilities
{
    public class GeneralCollections
    {
        public static System.Web.Mvc.SelectList RolesList
        {
            get
            {
                
                Dictionary<string, string> dictionary = new Dictionary<string, string>();

                foreach (string role in Roles.GetAllRoles())
                {
                    dictionary.Add(role, role);
                }

                return new System.Web.Mvc.SelectList(dictionary, "Key", "Value");

            }
        }
    }
}