/*using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EduGestor.Models;
using EduGestor.Models.ViewModels;

public class CuentaController : Controller
{
    private EduGestorEntities db = new EduGestorEntities();

    public ActionResult Index()
    {
        // Asumiendo que tenemos el ID del usuario actual almacenado en la sesión
        var usuarioID = Convert.ToInt32(Session["UsuarioID"]);
        var usuario = db.Usuarios.FirstOrDefault(u => u.UsuarioID == usuarioID);

        if (usuario != null)
        {
            var viewModel = new CuentaViewModel
            {
                NombreCompleto = $"{usuario.PrimerNombre} {usuario.Apellido}"
            };

            // Determinar si el usuario es estudiante o profesor basado en su RolID
            var perfilUsuario = db.PerfilUsuario.FirstOrDefault(p => p.UsuarioID == usuarioID);
            var esEstudiante = perfilUsuario != null && perfilUsuario.Carrera != null;

            if (esEstudiante)
            {
                // Usuario es estudiante
                viewModel.Carrera = perfilUsuario.Carrera;
            }
            else
            {
                // Usuario es profesor, buscar los cursos que imparte
                viewModel.CursosImpartidos = db.ProfesoresCursos
                                                .Where(pc => pc.UsuarioID == usuarioID)
                                                .Join(db.Cursos, pc => pc.CursoID, c => c.CursoID, (pc, c) => c.NombreCurso)
                                                .ToList();
            }

            return View(viewModel);
        }
        else
        {
            return HttpNotFound("Usuario no encontrado.");
        }
    }
}

*/
