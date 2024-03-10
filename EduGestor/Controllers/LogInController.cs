using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EduGestor.Models;
using EduGestor.Models.ViewModels;

public class LogInController : Controller
{
    private EduGestorEntities db = new EduGestorEntities();

    // [AllowAnonymous]
    public ActionResult Login()
    {
        ViewBag.HideSidebar = true;
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Login(LogInViewModel model)
    {

        ViewBag.HideSidebar = true;


        if (ModelState.IsValid)
        {
            if (!model.Correo.EndsWith("@ulacit.es") && !model.Correo.EndsWith("@ulacit.pr"))
            {
                ModelState.AddModelError("", "El correo debe ser institucional (@ulacit.es o @ulacit.pr).");
                return View(model);
            }

            var usuario = db.Usuarios.FirstOrDefault(u => u.Correo == model.Correo && u.Contrasena == model.Contrasena);
            if (usuario != null)
            {
                // Guardar el ID del usuario en la sesión
                Session["UsuarioID"] = usuario.UsuarioID;
                return RedirectToAction("Index", "Home"); // Página principal tras login exitoso
            }
            else
            {
                ModelState.AddModelError("", "El correo o la contraseña son incorrectos.");
            }
        }

        return View(model); // Retornar a la vista de login si falla
    }
}