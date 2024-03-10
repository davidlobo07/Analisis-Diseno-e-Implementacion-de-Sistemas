using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EduGestor.Models;
using EduGestor.Models.ViewModels;

public class DashboardController : Controller
{
    private EduGestorEntities db = new EduGestorEntities();

    public ActionResult AsignacionesProximas()
    {
        if (Session["UsuarioID"] != null)
        {
            var usuarioID = Convert.ToInt32(Session["UsuarioID"]);
            var asignacionesProximas = db.Asignaciones
                                          .Where(a => a.UsuarioID == usuarioID && a.FechaEntrega >= DateTime.Now)
                                          .Select(a => new AsignacionViewModel
                                          {
                                              AsignacionID = a.AsignacionID,
                                              CursoID = a.CursoID,
                                              UsuarioID = a.UsuarioID,
                                              Descripcion = a.Descripcion,
                                              FechaEntrega = a.FechaEntrega,
                                              NombreCurso = a.Curso.NombreCurso, 
                                              NombreAsignacion = a.NombreAsignacion,
                                          }).ToList();

            return View(asignacionesProximas);
        }
        else
        {
            // Redirigir al usuario a la página de login si no está autenticado
            return RedirectToAction("Login", "LogIn");
        }
    }

    public ActionResult DetalleAsignacion(int id)
    {
        var asignacion = db.Asignaciones
                            .Where(a => a.AsignacionID == id)
                            .Select(a => new AsignacionViewModel
                            {
                                AsignacionID = a.AsignacionID,
                                Descripcion = a.Descripcion,
                                FechaEntrega = a.FechaEntrega,
                                NombreCurso = a.Curso.NombreCurso,
                                NombreAsignacion = a.NombreAsignacion,
                                // incluir cualquier otro detalle necesario aquí
                            }).FirstOrDefault();

        if (asignacion != null)
        {
            return View(asignacion);
        }
        else
        {
            return HttpNotFound();
        }
    }

}
