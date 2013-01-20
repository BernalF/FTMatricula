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
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var user in db.ApplicationUsers
                                        .Where(appUser => appUser.RoleName == "Coordinator")
                                        .ToList()
                                        .Select(appUser => new { appUser.UserId, appUser.UserName }).ToArray())
                {
                    dictionary.Add(user.UserId, user.UserName);
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        public static SelectList ModalityList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var modality in db.Modalities                                        
                                        .ToList()
                                        .Select(mod => new { mod.ModalityID, mod.Name }).ToArray())
                {
                    dictionary.Add(modality.ModalityID, modality.Name);
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }
    }
}