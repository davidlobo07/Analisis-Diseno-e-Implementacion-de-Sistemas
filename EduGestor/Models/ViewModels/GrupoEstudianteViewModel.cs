using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EduGestor.Models.ViewModels
{
    public class GrupoEstudianteViewModel
    {
        public int GrupoID { get; set; }
        public string NombreGrupo { get; set; }
        public List<EstudianteViewModel> Estudiantes { get; set; }

        // Constructor para inicializar la lista Estudiantes
        public GrupoEstudianteViewModel()
        {
            Estudiantes = new List<EstudianteViewModel>();
        }
    }

    public class EstudianteViewModel
    {
        public int EstudianteID { get; set; }
        public string NombreEstudiante { get; set; }
        // Otros campos relevantes
    }
}