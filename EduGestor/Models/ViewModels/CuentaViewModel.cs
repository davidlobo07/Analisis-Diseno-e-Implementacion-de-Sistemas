using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class CuentaViewModel
    {
        public string NombreCompleto { get; set; }
        public string Carrera { get; set; } // Puede ser null si el usuario no es un estudiante
        public List<string> CursosImpartidos { get; set; } // Puede estar vacío si el usuario no es un profesor
    }

}