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
    
    public partial class tblDestek
    {
        public int Id { get; set; }
        public string DestekNotu { get; set; }
        public System.DateTime Tarih { get; set; }
        public string DestekTipi { get; set; }
        public int KullaniciId { get; set; }
        public Nullable<bool> Durum { get; set; }
    
        public virtual tblKullanici tblKullanici { get; set; }
    }
}
