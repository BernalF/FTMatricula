using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FTMatricula.Models
{
    /// <summary>
    /// Enroll Group
    /// </summary>
    public class EnrollGroup
    {
        public string EnrollmentCourseID { get; set; }
        public string GroupName { get; set; }
        public string ProfessorID { get; set; }
        public int Quota { get; set; }

        public List<EnrollSchedule> ScheduleList { get; set; }
    }

    /// <summary>
    /// Enroll Schedule
    /// </summary>
    public class EnrollSchedule
    {
        public string ClassroomID { get; set; }
        public string DayOfWeek { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
    }

    /// <summary>
    /// Enroll Group Detail
    /// </summary>
    public class EnrollGroupDetail
    {
        public string EnrollmentGroupID { get; set; }
        public string CourseCode { get; set; }
        public string GroupName { get; set; }
        public string ClassroomCode { get; set; }
        public string Schedule { get; set; }
        public string ProfessorName { get; set; }
    }

    /// <summary>
    /// Enrollment Init
    /// </summary>
    public class EnrollmentInit
    {
        /// <summary>
        /// Default Enrollment Init Constructor
        /// </summary>
        public EnrollmentInit() {
            this.Student = new EnrollmentStudent();
            this.Message = new ServerMessage();
            this.StudentList = new List<EnrollmentStudent>();
        }


        public System.Guid? EnrollmentID { get; set; }
        public EnrollmentStudent Student { get; set; }
        public bool IsStudentOK { get; set; }
        public bool IsReadyToEnroll { get; set; }
        public string ServerRequest { get; set; }

        public ServerMessage Message { get; set; }

        public IList<EnrollmentStudent> StudentList { get; set; }
    }

    /// <summary>
    /// Enrollment Student
    /// </summary>
    public class EnrollmentStudent
    {
        public System.Guid? StudentID { get; set; }
        public string Identification { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone1 { get; set; }
    }

    


}