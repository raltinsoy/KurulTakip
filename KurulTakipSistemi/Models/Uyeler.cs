//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Uyeler
    {
        public int UyeID { get; set; }
        public int KurulID { get; set; }
        public int PersNo { get; set; }
        public Nullable<bool> PersMi { get; set; }
        public Nullable<bool> Aktif { get; set; }
        public Nullable<System.DateTime> UyeCikisTarihi { get; set; }
        public Nullable<System.DateTime> UyeOlusTarihi { get; set; }
    
        public virtual Kurullar Kurullar { get; set; }
    }
}
