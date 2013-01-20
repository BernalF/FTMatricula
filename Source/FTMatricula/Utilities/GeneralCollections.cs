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
                foreach (string role in Roles.GetAllRoles().Where(x => x != "Student"))
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

        public static SelectList MaritalStatusList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var t in db.Types
                                        .Where(x => x.Usage == "MST")
                                        .ToList()
                                        .Select(x => new { x.TypeID, x.Name }).ToArray())
                {
                    dictionary.Add(t.TypeID, t.Name);
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        public static SelectList CountriesList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var c in db.Countries
                                        .ToList()
                                        .Select(x => new { x.CountryID, x.CountryName }).ToArray())
                {
                    dictionary.Add(c.CountryID, c.CountryName);
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        public static System.Web.Mvc.SelectList GenderList
        {
            get
            {
                return new System.Web.Mvc.SelectList(new Dictionary<string, string> { 
                    {"M","Male"},
                    {"F","Female"}
                }, "Key", "Value");
            }
        }
    }
}