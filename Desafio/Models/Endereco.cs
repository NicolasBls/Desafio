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
    
    public partial class Endereco
    {
        public int enderecoId { get; set; }
        public string estado { get; set; }
        public string cidade { get; set; }
        public string bairro { get; set; }
        public string endereco1 { get; set; }
        public Nullable<int> numero { get; set; }
        public string complemento { get; set; }
        public int pessoaId { get; set; }
        public string cep { get; set; }
    
        public virtual Pessoa Pessoa { get; set; }
    }
}
