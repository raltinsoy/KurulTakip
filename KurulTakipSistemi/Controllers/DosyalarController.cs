using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KurulTakipSistemi.Models;
using System.Data.Entity;
using System.IO;

namespace KurulTakipSistemi.Controllers
{
    public class DosyalarController : Controller
    {
        private KurullarEntities db = new KurullarEntities();

        // GET: Dosyalar
        public ActionResult Index(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            IEnumerable<sp_GetSecilenKurulDosya_Result> dosya = db.sp_GetSecilenKurulDosya(id);
            return View(dosya);
        }

        public FileResult Download(string ImageName)
        {
            var dosyaAdi = Path.GetFileName(ImageName);
            return File("" + ImageName, System.Net.Mime.MediaTypeNames.Application.Octet,dosyaAdi);
        }

        // GET: Dosyalar/Create
        public ActionResult Create(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            int sorgu = db.Kurullar.Where(s => s.KurulID == id).Count();
            if (sorgu == 0)
                return HttpNotFound();
            return View();
        }

        // POST: Dosyalar/Create
        // YukleyenPersNo, kullanıcı girişi eklendiğinde düzenlenecek!
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase file,[Bind(Include = "DosyaID,"+
            "KurulID,DosyaAdi,DosyaYeniAdi,YukleyenPersNo,Aciklama,Tur")] Dosyalar dosya)
        {
            if (ModelState.IsValid)
            {
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Upload"), fileName);
                    file.SaveAs(path);
                    dosya.DosyaYeniAdi = "/Upload/" + fileName;
                    db.Dosyalar.Add(dosya);
                    db.SaveChanges();
                }
                return RedirectToAction("Index", "Dosyalar", 
                    routeValues: new { id = dosya.KurulID });
            }
            return View();
        }

        // GET: Dosyalar/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            sp_GetDosyaBilgisi_Result dosya = db.sp_GetDosyaBilgisi(id).FirstOrDefault();
            if (dosya == null)
                return HttpNotFound();
            return View(dosya);
        }

        // POST: Dosyalar/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DosyaID,KurulID,"+
            "DosyaAdi,DosyaYeniAdi,YukleyenPersNo,Aciklama,Tur")] Dosyalar dosya)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dosya).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Dosyalar",
                    routeValues: new { id = dosya.KurulID });
            }
            return View();
        }

        public bool DeleteConfirmedAjax(int? id)
        {
            if (id == null)
                return false;
            Dosyalar dosya = db.Dosyalar.Find(id);
            if (dosya == null)
                return false;
            db.Dosyalar.Remove(dosya);
            db.SaveChanges();
            return true;
        }
    }
}
