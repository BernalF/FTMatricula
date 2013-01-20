using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using FTMatricula.Models;

namespace FTMatricula.Utilities
{
    public class GeneralCollections
    {
        public static SelectList RolesList
        {
            get
            {
                Dictionary<string, string> dictionary = new Dictionary<string, string>();
                foreach (string role in Roles.GetAllRoles())
                {
                    dictionary.Add(role, role);
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        public static SelectList CoordinatorList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.ApplicationUsers
                                        .Where(appUser => appUser.RoleName == "Coordinator")
                                        .ToList()
                                        .Select(appUser => new { appUser.UserId, appUser.UserName }), "UserId", "UserName");
            }
        }

        public static SelectList ModalityList
        {
            get
            {               
                matrifunDBEntities db = new matrifunDBEntities();               
                return new SelectList(db.Modalities
                                        .ToList()
                                        .Select(mod => new { mod.ModalityID, mod.Name }), "ModalityID", "Name");
            }
        }
    }
}