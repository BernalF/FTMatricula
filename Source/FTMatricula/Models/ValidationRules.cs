using FTMatricula.Utilities.Helper;
using System;
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

    //------ ApplicationUser Section
    [MetadataType(typeof(ApplicationUser_Validation))]
    public partial class ApplicationUser {
        public string tmpUserName { get; set; }
    }

    public class ApplicationUser_Validation
    {
        [Display(ResourceType = typeof(ModelResources), Name = "IDENTIFICATION")]
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [StringLength(100, ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "PASS_STRING_LENGTH", MinimumLength = 6)]
        public string UserName { get; set; }

        [Display(ResourceType = typeof(ModelResources), Name = "FIRST_NAME")]
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string FirstName { get; set; }

        [Display(ResourceType = typeof(ModelResources), Name = "LAST_NAME")]
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string LastName { get; set; }

        [Display(ResourceType = typeof(ModelResources), Name = "DATE_OF_BIRTH")]
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [DataType(DataType.DateTime)]
        public Nullable<System.DateTime> DateOfBirth { get; set; }

        [Display(ResourceType = typeof(ModelResources), Name = "PHONE_MOB")]
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string Phone1 { get; set; }

    }

    //------ SchemeDetail Section
    [MetadataType(typeof(SchemeDetail_Validation))]
    public partial class SchemeDetail
    {
        public string tmpOwnerUserId { get; set; }
        public string tmpCoordinatorUserId { get; set; }
        public string tmpModalityID { get; set; }
        public string tmpReqID { get; set; }
    }

    public class SchemeDetail_Validation
    {

    }

    //------ RequerimentDetail Section
    [MetadataType(typeof(SchemeDetail_Validation))]
    public partial class RequirementDetail
    {
        public string tmpTypeID { get; set; }        
    }

    public class RequirementDetail_Validation
    {

    }


    [MetadataType(typeof(StudentAdditionalData_Validation))]
    public partial class StudentAdditionalData
    {
   
    }

    public class StudentAdditionalData_Validation
    {
        [Display(ResourceType = typeof(ModelResources), Name = "STUDENT_PHYSICA_LADDRESS")]
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        public string PhysicalAddress { get; set; }
        [Display(ResourceType = typeof(ModelResources), Name = "STUDENT_WORKS")]
        public bool Works { get; set; }
        [Display(ResourceType = typeof(ModelResources), Name = "STUDENT_STUDIES")]
        public bool Studies { get; set; }
        [Display(ResourceType = typeof(ModelResources), Name = "STUDENT_RECEIVE_OFFERS")]
        public bool ReceiveOffers { get; set; }
        [Display(ResourceType = typeof(ModelResources), Name = "STUDENT_RECEIVE_NEWS")]
        public bool ReceiveNews { get; set; }
    }

    
}