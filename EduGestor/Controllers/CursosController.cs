using System;
using System.Linq;
using System.Web.Mvc;
using EduGestor.Models;
using EduGestor.Models.ViewModels;

public class CursosController : Controller
{
    private EduGestorEntities db = new EduGestorEntities();

    public ActionResult GruposPorProfesor()
    {
        if (Session["UsuarioID"] != null)
        {
            var usuarioID = Convert.ToInt32(Session["UsuarioID"]);
            var nombreProfesor = db.Usuarios
                                   .Where(u => u.UsuarioID == usuarioID)
                                   .Select(u => u.PrimerNombre + " " + u.Apellido)
                                   .FirstOrDefault(); 

            // Aquí es donde ordenamos los cursos por NombreCurso alfabéticamente
            var cursos = db.ProfesoresCursos
                           .Where(pc => pc.UsuarioID == usuarioID)
                           .Select(pc => new CursoDetalle
                           {
                               CursoID = pc.CursoID,
                               NombreCurso = pc.Curso.NombreCurso,
                               Grupos = db.Grupos
                                          .Where(g => g.CursoID == pc.CursoID && g.UsuarioID == usuarioID)
                                          .Select(g => new GrupoDetalle
                                          {
                                              GrupoID = g.GrupoID,
                                              NombreGrupo = g.NombreGrupo
                                          }).ToList()
                           })
                           .OrderBy(cd => cd.NombreCurso) // Ordenar por NombreCurso
                           .ToList();

            var viewModel = new CursoGrupoViewModel
            {
                UsuarioID = usuarioID,
                NombreProfesor = nombreProfesor,
                Cursos = cursos // Ahora los cursos están ordenados alfabéticamente
            };

            return View("~/Views/Grupos/GruposPorProfesor.cshtml", viewModel);
        }
        else
        {
            return RedirectToAction("Login", "LogIn");
        }
    }

    public ActionResult GestionGrupos(int cursoId)
    {
        // Aquí asumimos que ya tienes una lógica para recuperar los grupos del curso seleccionado.
        var grupos = db.Grupos
            .Where(g => g.CursoID == cursoId)
            .Select(g => new GrupoEstudianteViewModel
            {
                GrupoID = g.GrupoID,
                NombreGrupo = "Grupo " + g.GrupoID, // Ajusta según cómo quieras formatear el nombre del grupo
                                                    // Aquí deberías cargar los estudiantes de cada grupo, si es necesario para la vista.
            })
            .ToList();

        return View("~/Views/Grupos/VistaGrupos.cshtml", grupos);
    }

}

