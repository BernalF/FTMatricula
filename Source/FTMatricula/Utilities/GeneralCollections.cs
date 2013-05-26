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
                                        .OrderBy(x => x.Name)
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
                                        .OrderBy(x => x.Name)
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
                                        .OrderBy(x => x.CountryName)
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
        public static SelectList GenderList
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
                                        .OrderBy(t => t.Name)
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
        public static SelectList PlanList(string userID, bool isSchoolAdmin)
        {
            matrifunDBEntities db = new matrifunDBEntities();
            if (isSchoolAdmin)
            {
                Guid? schoolID = Misc.GetSchoolID(userID);
                return new SelectList(db.Plans
                                            .ToList()
                                            .Join(db.Scheme_Plan, p => p.PlanID, sp => sp.PlanID, (p, sp) => new { p, sp })
                                            .Where(m => m.p.isActive == true
                                               && m.sp.Scheme.SchoolID == schoolID)
                                            .Select(m => new
                                            {
                                                m.p.PlanID,
                                                Name = m.p.Name + " - " + m.p.Description + " - v. " + m.p.Version
                                            }), "PlanID", "Name");
            }
            else
            {
                return new SelectList(db.Plans
                                            .ToList()
                                            .Where(p => p.isActive == true)
                                            .Select(p => new
                                            {
                                                p.PlanID,
                                                Name = p.Name + " - " + p.Description + " - v. " + p.Version
                                            }), "PlanID", "Name");
            }
        }

        /// <summary>
        /// Scheme List
        /// </summary>
        public static SelectList SchemeList(string userID, bool isSchoolAdmin)
        {

            matrifunDBEntities db = new matrifunDBEntities();
            if (isSchoolAdmin)
            {
                Guid? schoolID = Misc.GetSchoolID(userID);
                return new SelectList(db.Schemes
                                       .Where(s => s.SchoolID == schoolID)
                                       .ToList()
                                       .Select(p => new { p.SchemeID, p.Name }), "SchemeID", "Name");
            }
            else
            {
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

        /// <summary>
        /// List of Courses by Professor
        /// </summary>
        public static SelectList CoursesByProf(string userName)
        {
            matrifunDBEntities db = new matrifunDBEntities();

            //Get StudentID by LoggedUserID
            var uID = SessApp.GetUserID(userName);
            //Guid? uID = new Guid("8EE28BDB-2470-431B-A3DE-FEF8B2A2D4F0");
            /*return new SelectList(db.Scores
                    .Where(s => s.EnrollmentGroup.ProfessorID == uID)
                    .Select(s => new { CourseID = s.CourseID, Name = s.Course.Name }).Distinct(), "CourseID", "Name");*/

            return new SelectList(db.EnrollmentGroups
                    .Where(x => x.ProfessorID == uID)
                    .Select(x => new { CourseID = x.EnrollmentCourse.CourseID, Name = x.EnrollmentCourse.Course.Name }), "CourseID", "Name");
        }


        /// <summary>
        /// Professor List
        /// </summary>
        public static SelectList ProfessorList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.ApplicationUsers
                    .Where(p => p.RoleName == "ROLE_TEACHER")
                                        .ToList()
                                        .Select(p => new { ProfessorID = p.UserId, ProfessorName = p.FirstName + " " + p.LastName }), "ProfessorID", "ProfessorName");
            }
        }

        /// <summary>
        /// Classrooms List
        /// </summary>
        public static SelectList ClassroomsList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.Classrooms
                                    .ToList()
                                    .OrderBy(c => c.Code + " - " + c.Description)
                                    .Select(c => new { c.ClassroomID, Code = c.Code + " - " + c.Description }), "ClassroomID", "Code");
            }
        }

        /// <summary>
        /// Days List
        /// </summary>
        public static SelectList DaysList
        {
            get
            {
                return new System.Web.Mvc.SelectList(new Dictionary<string, string> { 
                    {"L","Lunes"},
                    {"K","Martes"},
                    {"M","Miercoles"},
                    {"J","Jueves"},
                    {"V","Viernes"},
                    {"S","Sabado"},
                    {"D","Domingo"}
                }, "Key", "Value");
            }
        }

        /// <summary>
        /// Enrollments List
        /// </summary>
    
        public static SelectList EnrollmentsList(string userName, bool IsSchoolAdmin)
        {
            matrifunDBEntities db = new matrifunDBEntities();

            Guid? schoolID = IsSchoolAdmin?Misc.GetSchoolID(userName):null;
            IList<Guid?> aux = IsSchoolAdmin ?
                                            db.Schemes.Where(x => x.SchoolID == schoolID).FirstOrDefault().Scheme_Plan.Select(p => p.PlanID).ToList()
                                            : new List<Guid?>();

            return new SelectList(db.Enrollments
                                .Where(e => IsSchoolAdmin == false || aux.Contains(e.PlanID))
                                .ToList()
                                .Select(e => new { e.EnrollmentID, Description = e.Description + " -- " + e.Plan.Description }), "EnrollmentID", "Description");
        }

        /// <summary>
        /// Students List
        /// </summary>
        public static SelectList StudentsList
        {
            get
            {
                matrifunDBEntities db = new matrifunDBEntities();
                return new SelectList(db.Students
                                    .ToList()
                                    .OrderBy(s => s.FirstName)
                                    .Select(s => new { s.StudentID, Name = s.User.UserName + " -- " + s.FirstName + " " + s.LastName }), "StudentID", "Name");
            }
        }

        /// <summary>
        /// School List
        /// </summary>
        public static SelectList SchoolList(string userID, bool isSchoolAdmin)
        {
            matrifunDBEntities db = new matrifunDBEntities();
            if (isSchoolAdmin)
            {
                Guid? schoolID = Misc.GetSchoolID(userID);
                return new SelectList(db.Schools
                                    .Where(s => s.SchoolID == schoolID)
                                    .ToList()
                                    .Select(s => new { s.SchoolID, s.Name }), "SchoolID", "Name");
            }
            else
            {
                return new SelectList(db.Schools
                                    .ToList()
                                    .Select(s => new { s.SchoolID, s.Name }), "SchoolID", "Name");
            }
        }

        /// <summary>
        /// Score Criteria List
        /// </summary>
        public static SelectList ScoreCriteriaList
        {
            get
            {
                Dictionary<Guid?, string> dictionary = new Dictionary<Guid?, string>();
                matrifunDBEntities db = new matrifunDBEntities();

                foreach (var t in db.Types
                                        .Where(x => x.Usage == "CSC")
                                        .ToList()
                                        .OrderBy(x => x.Name)
                                        .Select(x => new { x.TypeID, x.Name }).ToArray())
                {
                    dictionary.Add(t.TypeID, Resources.GetValue(t.Name));
                }
                return new SelectList(dictionary, "Key", "Value");
            }
        }
    }
}

