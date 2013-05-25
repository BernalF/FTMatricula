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
    using System;
    using System.Collections.Generic;
    
    public partial class Type
    {
        public Type()
        {
            this.Students = new HashSet<Student>();
            this.Students1 = new HashSet<Student>();
            this.StudentAdditionalDatas = new HashSet<StudentAdditionalData>();
            this.StudentAdditionalDatas1 = new HashSet<StudentAdditionalData>();
            this.ScoreCriterias = new HashSet<ScoreCriteria>();
        }
    
        public System.Guid? TypeID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Usage { get; set; }
        public Nullable<System.DateTime> InsertDate { get; set; }
        public Nullable<System.Guid> InsertUserID { get; set; }
        public Nullable<System.DateTime> ModifyDate { get; set; }
        public Nullable<System.Guid> ModifyUserID { get; set; }
        public string IpAddress { get; set; }
    
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<Student> Students1 { get; set; }
        public virtual ICollection<StudentAdditionalData> StudentAdditionalDatas { get; set; }
        public virtual ICollection<StudentAdditionalData> StudentAdditionalDatas1 { get; set; }
        public virtual ICollection<ScoreCriteria> ScoreCriterias { get; set; }
    }
}
