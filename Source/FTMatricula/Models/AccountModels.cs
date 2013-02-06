using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Security;
using FTMatricula.Utilities.Helper;
using System.ComponentModel;

namespace FTMatricula.Models
{
    public class ChangePasswordModel
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(ModelResources), Name = "OLD_PASSWORD")]
        public string OldPassword { get; set; }

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [StringLength(100, ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "PASS_STRING_LENGTH", MinimumLength = 6)]
        [DataType(DataType.Password)]        
        [Display(ResourceType = typeof(ModelResources), Name = "NEW_PASSWORD")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display( ResourceType = typeof(ModelResources), Name = "PASS_CONFIRM")]
        [System.Web.Mvc.Compare("NewPassword", ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "PASS_CONFIRM_ERR")]
        public string ConfirmPassword { get; set; }
    }

    public class LoginModel
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [Display(ResourceType = typeof(ModelResources), Name = "USER")]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(ModelResources), Name = "PASSWORD")]
        public string Password { get; set; }

        [Display(ResourceType = typeof(ModelResources), Name = "REMEMBER")]
        public bool RememberMe { get; set; }
    }

    public class RegisterModel
    {
        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [Display(ResourceType = typeof(ModelResources), Name = "USERNAME")]
        public string UserName { get; set; }

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [DataType(DataType.EmailAddress)]
        [Display(ResourceType = typeof(ModelResources), Name = "EMAIL")]
        public string Email { get; set; }

        [Required(ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "REQUIRED")]
        [StringLength(100, ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "PASS_STRING_LENGTH", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(ModelResources), Name = "PASSWORD")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(ResourceType = typeof(ModelResources), Name = "PASS_CONFIRM")]
        [System.Web.Mvc.Compare("Password", ErrorMessageResourceType = typeof(ModelResources), ErrorMessageResourceName = "PASS_CONFIRM_ERR")]
        public string ConfirmPassword { get; set; }
    }


    public class UserModel
    {
        [Display(Name = "Usuario")]
        public string UserName { get; set; }

        [Display(Name = "Estado")]
        public string Status { get; set; }

        [Display(Name = "Correo Electronico")]
        public string Email { get; set; }
    }
}
