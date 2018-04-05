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
    public class SecilenKurulController : Controller
    {
        private KurullarEntities db = new KurullarEntities();

        // GET: SecilenKurul
        public ActionResult Index(int? id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            sp_GetSecilenKurulGenel_Result secilenKurul = db.sp_GetSecilenKurulGenel(id).FirstOrDefault();
            
            if (secilenKurul == null)
                return RedirectToAction("Index", "Kurul");

            var kurul = db.Kurullar.Find(id);
            if (kurul != null)
            {
                ViewBag.baskanId = kurul.Baskani;
                ViewBag.sponsorId = kurul.Sponsoru;
                ViewBag.raportorId = kurul.Raportor;
            }
            return View(secilenKurul);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "KurulID,Adi,Sponsoru,Baskani,"+
            "Raportor,Amac,KayitTarihi,Gundem,SiraNo,BasTarihi,Sorumluluklar,"+
            "IlgiliUstSurec,Politika")] Kurullar kurullar)
        {
            if (ModelState.IsValid)
            {
                Kurullar kurul = db.Kurullar.Find(kurullar.KurulID);

                if (kurul != null)
                {
                    kurul.Adi = kurullar.Adi;
                    kurul.Sponsoru = kurullar.Sponsoru;
                    kurul.Baskani = kurullar.Baskani;
                    kurul.Raportor = kurullar.Raportor;
                    kurul.Amac = kurullar.Amac;
                    kurul.Gundem = kurullar.Gundem;
                    kurul.BasTarihi = kurullar.BasTarihi;
                    kurul.Sorumluluklar = kurullar.Sorumluluklar;
                    kurul.IlgiliUstSurec = kurullar.IlgiliUstSurec;
                    kurul.Politika = kurullar.Politika;

                    db.Entry(kurul).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index", "SecilenKurul",
                        routeValues: new { id = kurul.KurulID });
                }
            }
            return HttpNotFound();
        }

        
    }
}
