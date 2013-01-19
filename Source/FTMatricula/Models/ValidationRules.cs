using FTMatricula.Utilities.Helper;
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

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
    }

    //------ Classroom Section
    [MetadataType(typeof(Classroom_Validation))]
    public partial class Classroom { }

    public class Classroom_Validation
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string Code { get; set; }
    }

    //------ Location Section
    [MetadataType(typeof(Location_Validation))]
    public partial class Location { }

    public class Location_Validation
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string Name { get; set; }

        [DataType(DataType.MultilineText)]
        public string Line1 { get; set; }

        [DataType(DataType.MultilineText)]
        public string Line2 { get; set; }
    }

    //------ Modality Section
    [MetadataType(typeof(Modality_Validation))]
    public partial class Modality { }

    public class Modality_Validation
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string Name { get; set; }
    }

    //------ Course Section
    [MetadataType(typeof(Course_Validation))]
    public partial class Course { }

    public class Course_Validation
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [StringLength(13, ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "MAX_LENGTH")]
        [Display(ResourceType = typeof(ModelResources), Name = "COURSE_CODE")]
        public string Code { get; set; }

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [StringLength(150, ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "MAX_LENGTH")]
        [Display(ResourceType = typeof(ModelResources), Name = "COURSE_NAME")]
        public string Name { get; set; }
        
        [DataType(DataType.Currency)]       
        public string Charge { get; set; }

    }
}