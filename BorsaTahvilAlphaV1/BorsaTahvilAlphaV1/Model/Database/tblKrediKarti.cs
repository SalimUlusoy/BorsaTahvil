//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BorsaTahvilAlphaV1.Model.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblKrediKarti
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblKrediKarti()
        {
            this.tblKullanici = new HashSet<tblKullanici>();
        }
    
        public int Id { get; set; }
        public string KrediKartiNumara { get; set; }
        public string KartUstundekiIsim { get; set; }
        public string KartAy { get; set; }
        public string KartYil { get; set; }
        public string KartCVC { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblKullanici> tblKullanici { get; set; }
    }
}
