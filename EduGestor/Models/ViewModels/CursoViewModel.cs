using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class CursoViewModel
    {
        public int CursoID { get; set; }
        public string NombreCurso { get; set; }
        public string Descripcion { get; set; }

        // Si los cursos están asociados con usuarios, se podria necesitar una lista de usuarios
        public List<UsuarioViewModel> Usuarios { get; set; }
    }
}