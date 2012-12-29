//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FTMatricula.Models
{
    using FTMatricula.Utilities.Helper;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Classroom
    {
        public Classroom()
        {
            this.Courses = new HashSet<Course>();
        }
        [ScaffoldColumn(false)]
        public System.Guid ClassroomID { get; set; }

        [Display(ResourceType = typeof(ModelResources), Name = "CLASSROOM_CODE")]
        public string Code { get; set; }

        [ScaffoldColumn(false)]
        public Nullable<System.DateTime> InsertDate { get; set; }

        [ScaffoldColumn(false)]
        public Nullable<System.Guid> InsertUserID { get; set; }

        [ScaffoldColumn(false)]
        public Nullable<System.DateTime> ModifyDate { get; set; }

        [ScaffoldColumn(false)]
        public Nullable<System.Guid> ModifyUserID { get; set; }

        [ScaffoldColumn(false)]
        public string IpAddress { get; set; }

        public virtual ICollection<Course> Courses { get; set; }
    }
}
