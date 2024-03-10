using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class LogInViewModel
    {
        [Required]
        [EmailAddress]
        [MaxLength(20)]
        public string Correo { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [MaxLength(20)]
        public string Contrasena { get; set; }

    }
}