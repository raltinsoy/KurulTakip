using KurulTakipSistemi.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace KurulTakipSistemi.Controllers
{
    public class UyelerController : Controller
    {
        private KurullarEntities db = new KurullarEntities();
        
        // GET: Uyeler
        public ActionResult Index(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            IEnumerable<sp_GetSecilenKurulUyeleri_Result> uyeler = db.sp_GetSecilenKurulUyeleri(id);
            var result = new SelectList(uyeler,"UyeID","AdSoyad");
            return View(result);
        }

        [HttpPost]
        public JsonResult PersonelGetirJson(string q)
        {
            if (q == null)
                return Json("");
            var asd = db.Personel.ToList();
            var result = db.Personel.Where(m => m.AdSoyad.Contains(q));
            return Json(result,JsonRequestBehavior.AllowGet);
        }

        // GET: Uyeler/Create
        public ActionResult Create(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            int sorgu = db.Kurullar.Where(s => s.KurulID == id).Count();
            if (sorgu == 0)
                return HttpNotFound();

            return View();
        }

        // POST: Uyeler/Create
        // KurulID seçilen kurula özel geliyor
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="sicilNo,kurulId")] YeniUye uyeKontrol)
        {
            if (ModelState.IsValid)
            {
                Uyeler uye = new Uyeler();
                uye.Aktif = true;
                uye.KurulID = uyeKontrol.kurulId;
                uye.PersMi = true;
                uye.PersNo = uyeKontrol.sicilNo;

                int? eklediMi;
                eklediMi = db.sp_UyelerEkle(null, uye.KurulID, uye.PersNo, uye.PersMi,
                    uye.Aktif, null, DateTime.Now).FirstOrDefault();
                if (eklediMi == 0)
                    ModelState.AddModelError("sicilNo", "Bu kullanıcı daha önceden eklenmiştir.");
                else if (eklediMi == 1){
                    db.SaveChanges();
                    return RedirectToAction("Index", "Uyeler",
                        routeValues: new { id = uyeKontrol.kurulId });
                }
            }
            return View();
        }

        public bool DeleteConfirmedAjax(int? id)
        {
            if (id == null)
                return false;

            Uyeler uye = db.Uyeler.Find(id);
            if (uye == null || uye.Aktif == false)
                return false;

            uye.Aktif = false; // Uye silinmiyor sadece aktif olmuyor
            uye.UyeCikisTarihi = DateTime.Now;
            db.Entry(uye).State = EntityState.Modified;
            db.SaveChanges();
            return true;
        }


    }
}
