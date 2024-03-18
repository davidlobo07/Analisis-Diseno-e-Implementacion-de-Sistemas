using System;
using System.Linq;
using System.Web.Mvc;
using EduGestor.Models;
using EduGestor.Models.ViewModels;

public class GruposController : Controller
{
    private EduGestorEntities db = new EduGestorEntities(); 

    public ActionResult VistaGrupos(int cursoId)
    {
        var grupos = db.Grupos
            .Where(g => g.CursoID == cursoId)
            .Select(g => new GrupoEstudianteViewModel
            {
                GrupoID = g.GrupoID,
                NombreGrupo = g.NombreGrupo,
                Estudiantes = db.EstudiantesGrupos
                    .Where(eg => eg.GrupoID == g.GrupoID)
                    .Select(eg => new EstudianteViewModel
                    {
                        EstudianteID = eg.EstudianteID, // Este es el UsuarioID del estudiante
                        NombreEstudiante = db.Usuarios
                            .Where(u => u.UsuarioID == eg.EstudianteID)
                            .Select(u => u.PrimerNombre + " " + u.Apellido)
                            .FirstOrDefault() // Asume que cada ID de estudiante corresponde a un único usuario
                    }).ToList()
            }).ToList();

        return View(grupos);
    }


}

