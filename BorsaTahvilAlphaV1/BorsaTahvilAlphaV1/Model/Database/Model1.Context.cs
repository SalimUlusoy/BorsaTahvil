﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DbBorsaTahvilEntities : DbContext
    {
        public DbBorsaTahvilEntities()
            : base("name=DbBorsaTahvilEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblBotBilgi> tblBotBilgi { get; set; }
        public virtual DbSet<tblKrediKarti> tblKrediKarti { get; set; }
        public virtual DbSet<tblKullanici> tblKullanici { get; set; }
        public virtual DbSet<tblManuelIslem> tblManuelIslem { get; set; }
        public virtual DbSet<tblYetki> tblYetki { get; set; }
    }
}
