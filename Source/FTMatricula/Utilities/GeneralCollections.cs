using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using FTMatricula.Models;
using FTMatricula.Utilities.Helper;

namespace FTMatricula.Utilities
{
    public class GeneralCollections
    {
        /// <summary>
        /// UserRoles List
        /// </summary>
        public static SelectList UserRolesList
        {
            get
            {

                Dictionary<string, string> dictionary = new Dictionary<string, string>();
                foreach (var t in Roles.GetAllRoles().Where(x => x != "ROLE_STUDENT")
                                                         .ToList()
                                                         .Select(x => new { RoleId = x, RoleName = x }).ToArray())
                {
                    dictionary.Add(t.RoleId, Resources.GetValue(t.RoleName));
                }

                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Coordinator List
        /// </summary>
        public static SelectList CoordinatorList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.ApplicationUsers
                                        .Where(appUser => appUser.RoleName == "ROLE_COORDINATOR")
                                        .ToList()
                                        .Select(appUser => new { appUser.UserId, appUser.UserName }), "UserId", "UserName");
            }
        }

        /// <summary>
        /// Modality List
        /// </summary>
        public static SelectList ModalityList
        {
            get
            {
                Dictionary<string, string> dictionary = new Dictionary<string, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var m in db.Modalities
                                        .ToList()
                                        .Select(mod => new { id = mod.ModalityID, name = mod.Name }).ToArray())
                {
                    dictionary.Add(m.id.ToString(), m.name);
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Marital Status List
        /// </summary>
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
                    dictionary.Add(t.TypeID, Resources.GetValue(t.Name));
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Who Pays List
        /// </summary>
        public static SelectList WhoPaysList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var t in db.Types
                                        .Where(x => x.Usage == "WPS")
                                        .ToList()
                                        .Select(x => new { x.TypeID, x.Name }).ToArray())
                {
                    dictionary.Add(t.TypeID, Resources.GetValue(t.Name));
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Know About Us List
        /// </summary>
        public static SelectList KnowAboutUsList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var t in db.Types
                                        .Where(x => x.Usage == "KAU")
                                        .ToList()
                                        .Select(x => new { x.TypeID, x.Name }).ToArray())
                {
                    dictionary.Add(t.TypeID, Resources.GetValue(t.Name));
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Identification List
        /// </summary>
        public static SelectList IdentificationList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var t in db.Types
                                        .Where(x => x.Usage == "IDS")
                                        .ToList()
                                        .Select(x => new { x.TypeID, x.Name }).ToArray())
                {
                    dictionary.Add(t.TypeID, Resources.GetValue(t.Name));
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Countries List
        /// </summary>
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

        /// <summary>
        /// Gender List
        /// </summary>
        public static System.Web.Mvc.SelectList GenderList
        {
            get
            {
                return new System.Web.Mvc.SelectList(new Dictionary<string, string> { 
                    {"M",Resources.GetValue("GENDER_MALE")},
                    {"F",Resources.GetValue("GENDER_FEMALE")}
                }, "Key", "Value");
            }
        }

        /// <summary>
        /// Requirement List
        /// </summary>
        public static SelectList RequirementList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                var typeID = (from r in db.RequirementDetails
                              join t in db.Types on r.TypeID equals t.TypeID
                              where t.Name == "REQ_PROGRAM"
                              select t.TypeID)
                              .Distinct()
                              .SingleOrDefault();

                return new SelectList(db.Requirements
                                        .Where(r => r.TypeID == typeID)
                                        .ToList()
                                        .Select(r => new { r.RequirementID, r.Name }), "RequirementID", "Name");
            }
        }

        /// <summary>
        /// Requirement Types List
        /// </summary>
        public static SelectList ReqTypeList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                foreach (var t in db.Types
                                        .Where(t => t.Usage == "REQ")
                                        .ToList()
                                        .Select(t => new { t.TypeID, t.Name }).ToArray())
                {
                    dictionary.Add(t.TypeID, Resources.GetValue(t.Name));
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }

        /// <summary>
        /// Plan List
        /// </summary>
        public static SelectList PlanList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.Plans
                                        .ToList()
                                        .Select(p => new { p.PlanID, Name = p.Name + " - " + p.Description }), "PlanID", "Name");
            }
        }

        /// <summary>
        /// Scheme List
        /// </summary>
        public static SelectList SchemeList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.Schemes
                                        .ToList()
                                        .Select(p => new { p.SchemeID, p.Name }), "SchemeID", "Name");
            }
        }

        /// <summary>
        /// Locations List
        /// </summary>
        public static SelectList LocationsList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.Locations
                                        .ToList()
                                        .Select(l => new { l.LocationID, Name = l.Name + " - " + l.Line1 }), "LocationID", "Name");
            }
        }
    }
}

