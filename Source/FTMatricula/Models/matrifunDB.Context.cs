﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class matrifunDBEntities : DbContext
    {
        public matrifunDBEntities()
            : base("name=matrifunDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Classroom> Classrooms { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Enrollment> Enrollments { get; set; }
        public DbSet<Location> Locations { get; set; }
        public DbSet<Place> Places { get; set; }
        public DbSet<Plan> Plans { get; set; }
        public DbSet<Plan_Course> Plan_Course { get; set; }
        public DbSet<Record> Records { get; set; }
        public DbSet<Requirement> Requirements { get; set; }
        public DbSet<Scheme> Schemes { get; set; }
        public DbSet<Scheme_Plan> Scheme_Plan { get; set; }
        public DbSet<Scheme_Requirement> Scheme_Requirement { get; set; }
        public DbSet<School> Schools { get; set; }
        public DbSet<School_Scheme> School_Scheme { get; set; }
        public DbSet<Score> Scores { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Student_Course> Student_Course { get; set; }
        public DbSet<Type> Types { get; set; }
        public DbSet<Resource> Resources { get; set; }
    }
}
