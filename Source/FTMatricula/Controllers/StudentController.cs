using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kendo.Mvc.UI;
using Kendo.Mvc.Extensions;
using FTMatricula.Utilities.Helper;
using FTMatricula.Models;
using System.Web.Security;

namespace FTMatricula.Controllers
{
    [KendoAjaxErrorHandler]
    public class StudentController : Controller
    {
        private matrifunDBEntities db = new matrifunDBEntities();


        public ActionResult index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult PagingUsers([DataSourceRequest] DataSourceRequest request)
        {

            return Json(db.Students
                    .Join(db.Users, s => s.UserID, u => u.UserId, (s, u) => new { s, u })
                    .Where(m => m.s.UserID == m.u.UserId && m.s.IsAppUser == false)
                    .ToList().Select(m => new { m.u.UserId, m.s.StudentID, m.u.UserName, m.s.FirstName, m.s.LastName })
                    .ToDataSourceResult(request));
        }

        public ActionResult Create()
        {
            return View(new ApplicationUser { DateOfBirth = DateTime.Today });
        }

        [HttpPost]
        public ActionResult Create(ApplicationUser model)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    MembershipCreateStatus createStatus;
                    Membership.CreateUser(model.UserName, model.UserName, model.Email, passwordQuestion: null, passwordAnswer: null, isApproved: true, providerUserKey: null, status: out createStatus);

                    if (createStatus != MembershipCreateStatus.Success)
                    {
                        ModelState.AddModelError("", "Error Insertando Estudiante");
                        return View(model);
                    }

                    Roles.AddUserToRole(model.UserName, "ROLE_STUDENT");

                    User user = db.Users.Where(x => x.UserName == model.UserName)
                                                      .ToList()
                                                      .FirstOrDefault();
                    Student student = new Student
                    {
                        StudentID = Guid.NewGuid(),
                        ModifyUserID = SessApp.GetUserID(User.Identity.Name),
                        ModifyDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                        UserID = user.UserId,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Gender = model.Gender,
                        DateOfBirth = model.DateOfBirth,
                        CountryID = model.CountryID,
                        MaritalStatusTypeID = model.MaritalStatusTypeID,
                        IdentificationTypeID = model.IdentificationTypeID,
                        Phone1 = model.Phone1,
                        Phone2 = model.Phone2,
                        Phone3 = model.Phone3,
                        IsAppUser = false
                    };

                    db.Students.Add(student);
                    db.SaveChanges();

                    return RedirectToAction("index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        public ActionResult EditPD(string id)
        {
            try
            {
                var x = db.Students
                    .Join(db.Users, s => s.UserID, u => u.UserId, (s, u) => new { s, u })
                    .Where(m => m.s.UserID == m.u.UserId && m.s.StudentID == new Guid(id))
                    .ToList().Select(m => new { m.u.UserId, m.s.StudentID, m.u.UserName, m.s.FirstName, m.s.LastName, m.s.DateOfBirth, m.s.Gender, m.s.MaritalStatusTypeID, m.s.CountryID, m.s.Phone1, m.s.Phone2, m.s.Phone3, tmpUserName = m.u.UserName })
                    .FirstOrDefault();

                MembershipUser aux = Membership.GetUser(x.UserName);
                

                return View(new ApplicationUser
                                {
                                    UserId = x.UserId,
                                    StudentID = x.StudentID,
                                    UserName = x.UserName,
                                    FirstName = x.FirstName,
                                    LastName = x.LastName,
                                    DateOfBirth = (DateTime)x.DateOfBirth,
                                    Gender = x.Gender,
                                    MaritalStatusTypeID = x.MaritalStatusTypeID,
                                    CountryID = x.CountryID,
                                    Phone1 = x.Phone1,
                                    Phone2 = x.Phone2,
                                    Phone3 = x.Phone3,
                                    tmpUserName = x.tmpUserName,
                                    Email = aux.Email
                                });
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        [HttpPost]
        public ActionResult EditPD(ApplicationUser model)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    if (Roles.GetRolesForUser(model.tmpUserName).Length > 0)
                        Roles.RemoveUserFromRoles(model.tmpUserName, Roles.GetRolesForUser(model.tmpUserName));

                    if (!model.UserName.Equals(model.tmpUserName))
                    {
                        db.uspUserNameUpdate(model.tmpUserName, model.UserName);
                    }

                    Roles.AddUserToRole(model.UserName, "ROLE_STUDENT");

                    MembershipUser aux = Membership.GetUser(model.UserName);
                    aux.Email = model.Email;
                    Membership.UpdateUser(aux);

                    Student user = new Student
                    {
                        StudentID = model.StudentID,
                        ModifyUserID = SessApp.GetUserID(User.Identity.Name),
                        ModifyDate = DateTime.Today,
                        IpAddress = Network.GetIpAddress(Request),
                        UserID = model.UserId,
                        FirstName = model.FirstName,
                        LastName = model.LastName,
                        Gender = model.Gender,
                        DateOfBirth = model.DateOfBirth,
                        CountryID = model.CountryID,
                        MaritalStatusTypeID = model.MaritalStatusTypeID,
                        IdentificationTypeID = model.IdentificationTypeID,
                        Phone1 = model.Phone1,
                        Phone2 = model.Phone2,
                        Phone3 = model.Phone3,
                        IsAppUser = false
                    };

                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("index");
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        public ActionResult EditAD(string id)
        {
            try
            {
                StudentAdditionalData x = db.StudentAdditionalDatas.Find(new Guid(id));
                if (x == null)
                    return View(new StudentAdditionalData { StudentID = new Guid(id) });
                else
                    return View(x);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }

        }

        [HttpPost]
        public ActionResult EditAD(StudentAdditionalData model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    StudentAdditionalData tmp = db.StudentAdditionalDatas.Find(model.StudentID);
                    if (tmp != null)
                    {
                        tmp.PhysicalAddress = model.PhysicalAddress;
                        tmp.AdditionalAddress = model.AdditionalAddress;
                        tmp.Works = model.Works;
                        tmp.Studies = model.Studies;
                        tmp.WorkPlace = model.WorkPlace;
                        tmp.JobTitle = model.JobTitle;
                        tmp.WhoPaysYourStudiesTypeID = model.WhoPaysYourStudiesTypeID;
                        tmp.HowYouKnowAboutUsTypeID = model.HowYouKnowAboutUsTypeID;
                        tmp.ReceiveOffers = model.ReceiveOffers;
                        tmp.ReceiveNews = model.ReceiveNews;
                        db.Entry(tmp).State = EntityState.Modified;
                        db.SaveChanges();
                        model = tmp;
                    }
                    else {
                        db.StudentAdditionalDatas.Add(model);
                        db.SaveChanges();
                    }
                }
                return View(model);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }

        public ActionResult EditStudies(string id)
        {
            return View(new Student { StudentID = new Guid(id) });
        }


        [HttpPost]
        public ActionResult PagingStudies([DataSourceRequest] DataSourceRequest request)
        {
            return Json(db.Students
                    .Join(db.Users, s => s.UserID, u => u.UserId, (s, u) => new { s, u })
                    .Where(m => m.s.UserID == m.u.UserId && m.s.IsAppUser == false)
                    .ToList().Select(m => new { m.u.UserId, m.s.StudentID, m.u.UserName, m.s.FirstName, m.s.LastName })
                    .ToDataSourceResult(request));
        }

        

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DestroyUser([DataSourceRequest] DataSourceRequest request, ApplicationUser model)
        {
            try
            {
                Student student = db.Students.Find(model.StudentID);
                if (student != null)
                {
                    db.Students.Remove(student);
                    db.SaveChanges();
                }

                if (Roles.GetRolesForUser(model.UserName).Length > 0)
                    Roles.RemoveUserFromRoles(model.UserName, Roles.GetRolesForUser(model.UserName));

                Membership.DeleteUser(model.UserName);
                return RedirectToAction("index");
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
            //return Json(new[] { new { } }.ToDataSourceResult(request, ModelState));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}