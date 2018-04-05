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
    public class AksiyonlarController : Controller
    {
        private KurullarEntities db = new KurullarEntities();

        // GET: Aksiyonlar
        public ActionResult Index(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            IEnumerable<sp_GetSecilenKurulAksiyon_Result> aksiyon = db.sp_GetSecilenKurulAksiyon(id);
            
            Kurullar kurul = db.Kurullar.Find(id);
            if (kurul != null)
                ViewBag.KurulAdi = kurul.Adi;

            return View(aksiyon);
        }

        // GET: Aksiyonlar/Create
        public ActionResult Create(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            int sorgu = db.Kurullar.Where(s => s.KurulID == id).Count();
            if (sorgu == 0)
                return HttpNotFound();

            return View();
        }

        // POST: Aksiyonlar/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "KurulID,KriterNo,GorusulenKonu,MevcutDurumu,SorumluPersNo,"+
            "GundemeTarihi,HedefTarihi,IsBitisTarihi,KayitSahibiPersNo,SorumluPersoneller,AksiyonSonucu,"+
            "Gelisme,Sonuc")] Aksiyonlar aksiyon)
        {
            if (ModelState.IsValid)
            {
                db.Aksiyonlar.Add(aksiyon);
                db.SaveChanges();
                return RedirectToAction("Index", "Aksiyonlar", routeValues: new { id = aksiyon.KurulID });
            }

            return View(aksiyon);
        }

        // GET: Aksiyonlar/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            Aksiyonlar aksiyon = db.Aksiyonlar.Find(id);
            if (aksiyon == null)
                return HttpNotFound();

            int sorumluNo = aksiyon.SorumluPersNo;
            int? sahibiNo = aksiyon.KayitSahibiPersNo;
            Personel p1 = db.Personel.Where(s => s.SicilNo == sorumluNo).FirstOrDefault();
            Personel p2 = db.Personel.Where(s => s.SicilNo == sahibiNo).FirstOrDefault();
            ViewBag.sorPerIsim = p1.AdSoyad;
            ViewBag.sahibiIsim = p2.AdSoyad;

            return View(aksiyon);
        }

        // POST: Aksiyonlar/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id,[Bind(Include = "KurulID,KriterNo,GorusulenKonu,MevcutDurumu,"+
            "SorumluPersNo,GundemeTarihi,HedefTarihi,IsBitisTarihi,KayitSahibiPersNo,SorumluPersoneller,"+
            "AksiyonSonucu,Gelisme,Sonuc")] Aksiyonlar aksiyon)
        {
            if (ModelState.IsValid)
            {
                var _aksiyon = db.Aksiyonlar.Where(s => s.AksiyonID == id).FirstOrDefault();
                if (_aksiyon != null)
                {
                    _aksiyon.AksiyonSonucu = aksiyon.AksiyonSonucu;
                    _aksiyon.Gelisme = aksiyon.Gelisme;
                    _aksiyon.GorusulenKonu = aksiyon.GorusulenKonu;
                    _aksiyon.GundemeTarihi = aksiyon.GundemeTarihi;
                    _aksiyon.HedefTarihi = aksiyon.HedefTarihi;
                    _aksiyon.IsBitisTarihi = aksiyon.IsBitisTarihi;
                    _aksiyon.KayitSahibiPersNo = aksiyon.KayitSahibiPersNo;
                    _aksiyon.KriterNo = aksiyon.KriterNo;
                    _aksiyon.MevcutDurumu = aksiyon.MevcutDurumu;
                    _aksiyon.Sonuc = aksiyon.Sonuc;
                    _aksiyon.SorumluPersNo = aksiyon.SorumluPersNo;
                    _aksiyon.SorumluPersoneller = aksiyon.SorumluPersoneller;

                    db.Entry(_aksiyon).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index", "Aksiyonlar", routeValues: new { id = _aksiyon.KurulID });
                }
            }
            return View();
        }

        public bool DeleteConfirmedAjax(int? id)
        {
            if (id == null)
                return false;

            Aksiyonlar aksiyon = db.Aksiyonlar.Find(id);

            if (aksiyon == null)
                return false;

            db.Aksiyonlar.Remove(aksiyon);
            db.SaveChanges();

            return true;
        }

    }
}
