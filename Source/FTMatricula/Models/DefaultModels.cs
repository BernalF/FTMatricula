using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FTMatricula.Models
{
    /// <summary>
    /// Message Severity
    /// </summary>
    public enum MessageSeverity
    {
        OK = 1,
        Alert = 0,
        Error = -1
    }

    /// <summary>
    /// Server Message
    /// </summary>
    public class ServerMessage
    {
        public ServerMessage() {
            this.Show = false;
            this.Text = "";
            this.Severity = MessageSeverity.OK;
        }

        public bool Show { get; set; }
        public string Text { get; set; }
        public MessageSeverity Severity { get; set; }
    }

    /// <summary>
    /// Student Courses
    /// </summary>
    public class StudentCourses {

        public string PlanCode { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string ClassroomCode { get; set; }
        public string ClassroomName { get; set; }
        public string Professor { get; set; }
        public string Schedule { get; set; }

    }

}