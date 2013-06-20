using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Security;
using FTMatricula.Utilities.Helper;
using System.ComponentModel;

namespace FTMatricula.Models
{
    public class ValidationCourse
    {
        public System.Guid? StudentID { get; set; }
        public string Identification { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone1 { get; set; }
    }
}
