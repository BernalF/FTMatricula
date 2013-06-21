using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Security;
using FTMatricula.Utilities.Helper;
using System.ComponentModel;

namespace FTMatricula.Models
{
    public class ValidationCourseModel
    {
        /// <summary>
        /// Default Validation Course Model Constructor
        /// </summary>
        public ValidationCourseModel()
        {
            this.Student = new EnrollStudent();
            this.Message = new ServerMessage();
            this.StudentList = new List<EnrollStudent>();
        }


        public System.Guid? PlanID { get; set; }
        public string PlanName { get; set; }
        public EnrollStudent Student { get; set; }
        public bool IsStudentOK { get; set; }
        public bool IsReadyToValidate { get; set; }
        public string ServerRequest { get; set; }

        public ServerMessage Message { get; set; }

        public IList<EnrollStudent> StudentList { get; set; }
    }
}
