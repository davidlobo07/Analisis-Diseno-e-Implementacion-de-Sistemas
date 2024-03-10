using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class GrupoViewModel
    {
        public int GrupoID { get; set; }
        public string NombreGrupo { get; set; }
        public int CursoID { get; set; }

        // Información adicional sobre los miembros del grupo o actividades
        public List<UsuarioViewModel> Miembros { get; set; }
    }
}