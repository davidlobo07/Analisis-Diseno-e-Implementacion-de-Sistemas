using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class CursoGrupoViewModel
    {
        public int UsuarioID { get; set; } // ID del profesor
        public string NombreProfesor { get; set; } // Podría ser útil para mostrar en la UI
        public List<CursoDetalle> Cursos { get; set; }
    }

    public class CursoDetalle
    {
        public int CursoID { get; set; }
        public string NombreCurso { get; set; }
        public List<GrupoDetalle> Grupos { get; set; }
    }

    public class GrupoDetalle
    {
        public int GrupoID { get; set; }
        public string NombreGrupo { get; set; }
        // Aquí se puede añadir más detalles sobre el grupo si es necesario
    }
}