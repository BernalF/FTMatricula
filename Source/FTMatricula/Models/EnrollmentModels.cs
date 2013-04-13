using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
        public bool isFirst { get; set; }
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
        public EnrollmentInit()
        {
            this.Student = new EnrollStudent();
            this.Message = new ServerMessage();
            this.StudentList = new List<EnrollStudent>();
        }


        public System.Guid? EnrollmentID { get; set; }
        public EnrollStudent Student { get; set; }
        public bool IsStudentOK { get; set; }
        public bool IsReadyToEnroll { get; set; }
        public bool AllowEnterPayNumber { get; set; }
        public string ServerRequest { get; set; }

        public ServerMessage Message { get; set; }

        public IList<EnrollStudent> StudentList { get; set; }
    }

    /// <summary>
    /// Enrollment Student
    /// </summary>
    public class EnrollStudent
    {
        public System.Guid? StudentID { get; set; }
        public string Identification { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone1 { get; set; }
    }

    /// <summary>
    /// Enrollment Info
    /// </summary>
    public class EnrollmentInfo
    {
        /// <summary>
        /// Default Enrollment Init Constructor
        /// </summary>
        public EnrollmentInfo()
        {
            this.Student = new EnrollStudent();
            this.Message = new ServerMessage();
            this.EnrollmentCourses = new List<EnrollCourse>();
        }

        public System.Guid? EnrollmentID { get; set; }
        public string EnrollmentDescription { get; set; }
        public IList<EnrollCourse> EnrollmentCourses { get; set; }
        public string PlanName { get; set; }
        public string SchoolDescription { get; set; }
        public EnrollStudent Student { get; set; }
        public ServerMessage Message { get; set; }

    }

    public class EnrollCourse
    {
        //public System.Guid? EnrollmentCourseID { get; set; }
        public System.Guid? CourseID { get; set; }
        public string CourseName { get; set; }
        public IList<EnrollGroupDetail> GroupsList { get; set; }
        public string JsonGroups
        {
            get
            {
                if (GroupsList.Count > 0)
                {
                    bool isFirst = true;
                    var s = new StringBuilder();
                    s.Append("{\"EnrollmentGroup\": [");
                    foreach (var g in this.GroupsList)
                    {
                        if (isFirst) isFirst = false; else s.Append(",");
                        
                        s.Append("{");

                        s.Append("\"isFirst\": " + g.isFirst.ToString().ToLower() + ",");
                        s.Append("\"EnrollmentGroupID\": \""+g.EnrollmentGroupID+"\",");
                        s.Append("\"CourseCode\": \"" + g.CourseCode + "\",");
                        s.Append("\"GroupName\": \"" + g.GroupName + "\",");
                        s.Append("\"ClassroomCode\": \"" + g.ClassroomCode + "\",");
                        s.Append("\"Schedule\": \"" + g.Schedule + "\",");
                        s.Append("\"ProfessorName\": \"" + g.ProfessorName + "\"");

                        s.Append("}");
                    }
                    s.Append("]}");
                    return s.ToString();
                }
                else
                    return "";
            }
        }
    }

    /// <summary>
    /// Enroll Student Group
    /// </summary>
    public class EnrollStudentGroup
    {
        public string EnrollmentGroupID { get; set; }
        public string StudentID { get; set; }
    }
}