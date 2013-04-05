using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FTMatricula.Models
{
    public class EnrollGroup
    {
        public string EnrollmentCourseID {get; set;}
        public string GroupName { get; set; }
        public string ProfessorID{get; set;}
        public int Quota { get; set; }

        public List<EnrollSchedule> ScheduleList { get; set; }
    }

    public class EnrollSchedule
    {
        public string ClassroomID { get; set; }
        public string DayOfWeek { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
    }
}