using System;
using System.ComponentModel.DataAnnotations;

namespace KurulTakipSistemi.Models
{
    [MetadataType(typeof(sp_Genel_Metadata))]
    public partial class sp_GetSecilenKurulGenel_Result { }

    public class sp_Genel_Metadata
    {
        [Display(Name="Başkan")]
        [Required(ErrorMessage="Başkan seçiniz.")]
        public string BaskanAdSoyad { get; set; }
        [Display(Name="Raportor")]
        [Required(ErrorMessage = "Raportor seçiniz.")]
        public string RaportorAdSoyad { get; set; }
        [Display(Name = "Sponsor")]
        [Required(ErrorMessage = "Sponsor seçiniz.")]
        public string SponsorAdSoyad { get; set; }
        [Display(Name = "Başlangıç Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> BasTarihi { get; set; }
        [Display(Name = "Sorumluluklar")]
        public string Sorumluluklar { get; set; }
        [Display(Name = "İlgili Üst Süreç")]
        public string IlgiliUstSurec { get; set; }
        [Display(Name = "Politika")]
        public string Politika { get; set; }
        [Display(Name = "Kurulun Adı")]
        public string Adi { get; set; }
        [Display(Name = "Amaç")]
        public string Amac { get; set; }
        [Display(Name = "Gündem")]
        public string Gundem { get; set; }
    }

    [MetadataType(typeof(sp_KurulDosya_Metadata))]
    public partial class sp_GetSecilenKurulDosya_Result { }

    public class sp_KurulDosya_Metadata
    {
        [Display(Name = "Yükleyen Kişi")]
        public string YukleyenKisi { get; set; }
        [Display(Name = "Açıklama")]
        public string Aciklama { get; set; }
        [Display(Name = "Dosya Adı")]
        public string DosyaAdi { get; set; }
    }

    [MetadataType(typeof(sp_DosyaBilgisi_Metadata))]
    public partial class sp_GetDosyaBilgisi_Result { }

    public class sp_DosyaBilgisi_Metadata
    {
        [Display(Name = "Dosyanın Adı" )]
        public string DosyaAdi { get; set; }
        [Display(Name = "Açıklama")]
        public string Aciklama { get; set; }
        [Display(Name = "Tür")]
        public string Tur { get; set; }
        [Display(Name = "Dosyayı Yükleyen Kişi")]
        public string AdSoyad { get; set; }
        [Display(Name = "Kurul")]
        public string KurulAdi { get; set; }
    }

    [MetadataType(typeof(sp_KurulAksiyon_Metadata))]
    public partial class sp_GetSecilenKurulAksiyon_Result { }

    public class sp_KurulAksiyon_Metadata
    {
        [Display(Name = "Kriter")]
        public string KriterNo { get; set; }
        [Display(Name = "Görüşülen Konu")]
        public string GorusulenKonu { get; set; }
        [Display(Name = "Mevcut Durumu")]
        public string MevcutDurumu { get; set; }
        [Display(Name = "Gelişme")]
        public string Gelisme { get; set; }
        [Display(Name = "Sonuç")]
        public string Sonuc { get; set; }
        [Display(Name = "Plan Kurulu")]
        public string PlanKurulu { get; set; }
        [Display(Name = "Sorumlu Personeller")]
        public string SorumluPersoneller { get; set; }
        [Display(Name = "Aksiyon Sonucu")]
        public string AksiyonSonucu { get; set; }
        [Display(Name = "Sorumlu Personel")]
        public string SorumluPers { get; set; }
        [Display(Name="Gündeme Geliş Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> GundemeTarihi { get; set; }
        [Display(Name="Hedef Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> HedefTarihi { get; set; }
        [Display(Name = "İş Bitiş Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> IsBitisTarihi { get; set; }
    }

    [MetadataType(typeof(KurullarView_Metadata))]
    public partial class KurullarView { }

    public class KurullarView_Metadata
    {
        [Display(Name = "Kurulun Adı")]
        public string KurulAdi { get; set; }
        [Display(Name = "Raportor")]
        public string RaportorAdSoyad { get; set; }
    }

    [MetadataType(typeof(Dosyalar_Metadata))]
    public partial class Dosyalar { }

    public class Dosyalar_Metadata
    {
        [Display(Name="Dosya Adı")]
        //[Range(1,Int32.MaxValue,ErrorMessage="Bir üye seçiniz.")]
        public string DosyaAdi { get; set; }

        [Display(Name = "Yükleyen Personel")]
        [Range(1,Int32.MaxValue,ErrorMessage="Bir üye seçiniz.")]
        public string YukleyenPersNo { get; set; }

        [Display(Name = "Açıklama")]
        [Required(ErrorMessage=("Açıklama boş geçilemez."))]
        public string Aciklama { get; set; }
    }

    [MetadataType(typeof(Kurullar_Metadata))]
    public partial class Kurullar { }

    public class Kurullar_Metadata
    {
        [Display(Name="Kurulun Adı")]
        public string Adi { get; set; }
        [Range(1, Int32.MaxValue, ErrorMessage = "Bir üye seçiniz.")]
        public int Sponsoru { get; set; }
        [Display(Name = "Başkanı")]
        [Range(1, Int32.MaxValue, ErrorMessage = "Bir üye seçiniz.")]
        public int Baskani { get; set; }
        [Range(1, Int32.MaxValue, ErrorMessage = "Bir üye seçiniz.")]
        public int Raportor { get; set; }
        [Display(Name = "Amaç")]
        public string Amac { get; set; }
        [Display(Name = "Gündem")]
        public string Gundem { get; set; }
        [Display(Name = "Sıra Numarası")]
        public Nullable<int> SiraNo { get; set; }
        [Display(Name = "Başlangıç Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> BasTarihi { get; set; }
        public string Sorumluluklar { get; set; }
        [Display(Name = "İlgili Üst Süreç")]
        public string IlgiliUstSurec { get; set; }
        public string Politika { get; set; }
    }

    [MetadataType(typeof(Aksiyonlar_Metadata))]
    public partial class Aksiyonlar { }

    public class Aksiyonlar_Metadata
    {
        [Display(Name="Kriter")]
        public string KriterNo { get; set; }
        [Display(Name = "Görüşülen Konu")]
        [Required(ErrorMessage = "Bu alanı boş geçmeyiniz.")]
        public string GorusulenKonu { get; set; }
        [Display(Name = "Mevcut Durumu")]
        public string MevcutDurumu { get; set; }
        [Display(Name = "Gündeme Geliş Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> GundemeTarihi { get; set; }
        [Display(Name = "Hedef Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> HedefTarihi { get; set; }
        [Display(Name = "İş Bitiş Tarihi")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> IsBitisTarihi { get; set; }
        [Display(Name = "Sorumlu Personeller")]
        public string SorumluPersoneller { get; set; }
        [Display(Name = "Aksiyon Sonucu")]
        public string AksiyonSonucu { get; set; }
        [Display(Name = "Gelişme")]
        public string Gelisme { get; set; }
        [Display(Name = "Sonuç")]
        public string Sonuc { get; set; }
        [Display(Name = "Kayıt Sahibi Personel")]
        [Range(1,Int32.MaxValue,ErrorMessage="Bir üye seçiniz.")]
        public int KayitSahibiPersNo { get; set; }
        [Range(1, Int32.MaxValue, ErrorMessage = "Bir üye seçiniz.")]
        [Display(Name = "Sorumlu Personel")]
        public int SorumluPersNo { get; set; }
    }

}