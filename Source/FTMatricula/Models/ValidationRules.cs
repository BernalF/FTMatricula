using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace FTMatricula.Models
{
    //------ School Section
    [MetadataType(typeof(School_Validation))]
    public partial class School { }

    public class School_Validation
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string Description { get; set; }
    }

    //------ Classroom Section
    [MetadataType(typeof(Classroom_Validation))]
    public partial class Classroom { }

    public class Classroom_Validation
    {
        [Required]
        public string Code { get; set; }
    }

    //------ Location Section
    [MetadataType(typeof(Location_Validation))]
    public partial class Location { }

    public class Location_Validation
    {
        [Required]
        public string Name { get; set; }                
    }

    //------ Type Section
    [MetadataType(typeof(Type_Validation))]
    public partial class Type { }

    public class Type_Validation
    {
        [Required]
        public string Name { get; set; }
    }

    //------ Course Section
    [MetadataType(typeof(Course_Validation))]
    public partial class Course { }

    public class Course_Validation
    {
        [Required]
        public string Name { get; set; }
    }
}