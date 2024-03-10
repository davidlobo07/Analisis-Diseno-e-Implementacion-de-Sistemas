using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class AsignacionViewModel
    {
        public int AsignacionID { get; set; }
        public int CursoID { get; set; }
        public int UsuarioID { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaEntrega { get; set; }
        public string NombreCurso { get; set; }
        public string NombreAsignacion { get; set; }
    }
}