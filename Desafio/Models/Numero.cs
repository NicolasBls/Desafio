//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Desafio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Numero
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Numero()
        {
            this.Pessoa1 = new HashSet<Pessoa>();
        }
    
        public int numeroId { get; set; }
        public string numero1 { get; set; }
        public int pessoaId { get; set; }
    
        public virtual Pessoa Pessoa { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Pessoa> Pessoa1 { get; set; }
    }
}
