﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KurulTakipSistemi.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class KurullarEntities : DbContext
    {
        public KurullarEntities()
            : base("name=KurullarEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Aksiyonlar> Aksiyonlar { get; set; }
        public virtual DbSet<Dosyalar> Dosyalar { get; set; }
        public virtual DbSet<Katilim> Katilim { get; set; }
        public virtual DbSet<Kurullar> Kurullar { get; set; }
        public virtual DbSet<Personel> Personel { get; set; }
        public virtual DbSet<Uyeler> Uyeler { get; set; }
        public virtual DbSet<KurullarView> KurullarView { get; set; }
    
        public virtual ObjectResult<sp_GetSecilenKurulUyeleri_Result> sp_GetSecilenKurulUyeleri(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetSecilenKurulUyeleri_Result>("sp_GetSecilenKurulUyeleri", idParameter);
        }
    
        public virtual ObjectResult<sp_GetSecilenKurulGenel_Result> sp_GetSecilenKurulGenel(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetSecilenKurulGenel_Result>("sp_GetSecilenKurulGenel", idParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> sp_UyelerEkle(Nullable<int> uyeID, Nullable<int> kurulID, Nullable<int> persNo, Nullable<bool> persMi, Nullable<bool> aktif, Nullable<System.DateTime> uyeCikisTarihi, Nullable<System.DateTime> uyeOlusTarihi)
        {
            var uyeIDParameter = uyeID.HasValue ?
                new ObjectParameter("UyeID", uyeID) :
                new ObjectParameter("UyeID", typeof(int));
    
            var kurulIDParameter = kurulID.HasValue ?
                new ObjectParameter("KurulID", kurulID) :
                new ObjectParameter("KurulID", typeof(int));
    
            var persNoParameter = persNo.HasValue ?
                new ObjectParameter("PersNo", persNo) :
                new ObjectParameter("PersNo", typeof(int));
    
            var persMiParameter = persMi.HasValue ?
                new ObjectParameter("PersMi", persMi) :
                new ObjectParameter("PersMi", typeof(bool));
    
            var aktifParameter = aktif.HasValue ?
                new ObjectParameter("Aktif", aktif) :
                new ObjectParameter("Aktif", typeof(bool));
    
            var uyeCikisTarihiParameter = uyeCikisTarihi.HasValue ?
                new ObjectParameter("UyeCikisTarihi", uyeCikisTarihi) :
                new ObjectParameter("UyeCikisTarihi", typeof(System.DateTime));
    
            var uyeOlusTarihiParameter = uyeOlusTarihi.HasValue ?
                new ObjectParameter("UyeOlusTarihi", uyeOlusTarihi) :
                new ObjectParameter("UyeOlusTarihi", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("sp_UyelerEkle", uyeIDParameter, kurulIDParameter, persNoParameter, persMiParameter, aktifParameter, uyeCikisTarihiParameter, uyeOlusTarihiParameter);
        }
    
        public virtual ObjectResult<sp_GetDosyaBilgisi_Result> sp_GetDosyaBilgisi(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetDosyaBilgisi_Result>("sp_GetDosyaBilgisi", idParameter);
        }
    
        public virtual ObjectResult<sp_GetSecilenKurulAksiyon_Result> sp_GetSecilenKurulAksiyon(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetSecilenKurulAksiyon_Result>("sp_GetSecilenKurulAksiyon", idParameter);
        }
    
        public virtual ObjectResult<sp_GetSecilenKurulDosya_Result> sp_GetSecilenKurulDosya(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetSecilenKurulDosya_Result>("sp_GetSecilenKurulDosya", idParameter);
        }
    }
}
