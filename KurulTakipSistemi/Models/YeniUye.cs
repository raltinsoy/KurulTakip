using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace KurulTakipSistemi.Models
{
    public class YeniUye
    {
        [Range(1, Int32.MaxValue, ErrorMessage = "Bir üye seçiniz.")]
        public int sicilNo { get; set; }
        public int kurulId { get; set; }
    }
}