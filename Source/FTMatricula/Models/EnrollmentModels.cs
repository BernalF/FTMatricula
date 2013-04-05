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
        public string EnrollmentCourseID {get; set;}
        public string GroupName { get; set; }
        public string ProfessorID{get; set;}
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


}