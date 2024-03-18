//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EduGestor.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Usuario
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Usuario()
        {
            this.Asignaciones = new HashSet<Asignacione>();
            this.EstudiantesGrupos = new HashSet<EstudiantesGrupos>();
            this.Grupos = new HashSet<Grupos>();
            this.PerfilUsuarios = new HashSet<PerfilUsuario>();
            this.ProfesoresCursos = new HashSet<ProfesoresCurso>();
        }
    
        public int UsuarioID { get; set; }
        public string Correo { get; set; }
        public string Contrasena { get; set; }
        public string PrimerNombre { get; set; }
        public string Apellido { get; set; }
        public Nullable<int> RolID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Asignacione> Asignaciones { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EstudiantesGrupos> EstudiantesGrupos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Grupos> Grupos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PerfilUsuario> PerfilUsuarios { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProfesoresCurso> ProfesoresCursos { get; set; }
        public virtual Role Role { get; set; }
    }
}
