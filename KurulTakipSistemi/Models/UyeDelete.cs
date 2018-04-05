using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace KurulTakipSistemi.Models
{
    public class UyeDelete
    {
        [Display(Name="Kurulun Adı")]
        public string kurulAdi { get; set; }
        [Display(Name = "Silinecek Kişi")]
        public string isim { get; set; }
        [Display(Name = "Müdürlüğü")]
        public string mudurluk { get; set; }
        [Display(Name = "Kayıt Tarihi")]
        public DateTime? kayitTarihi { get; set; }
        public int? kurulId { get; set; }
    }
}