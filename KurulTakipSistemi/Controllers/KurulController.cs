using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KurulTakipSistemi.Models;

namespace KurulTakipSistemi.Controllers
{
    public class KurulController : Controller
    {
        private KurullarEntities db = new KurullarEntities();

        // GET: Kurul
        public ActionResult Index()
        {
            return View(db.KurullarView.ToList());
        }

        // GET: Kurul/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Kurul/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "KurulID,Adi,Sponsoru,Baskani,Raportor,Amac,"+
            "KayitTarihi,Gundem,SiraNo,BasTarihi,Sorumluluklar,IlgiliUstSurec,Politika")] Kurullar kurullar)
        {
            if (ModelState.IsValid)
            {
                kurullar.KayitTarihi = DateTime.Now;

                db.Kurullar.Add(kurullar);
                db.SaveChanges();
                return RedirectToAction("Index", "SecilenKurul", routeValues: new { id = kurullar.KurulID });
            }

            return View(kurullar);
        }

        /*// GET: Kurul/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kurullar kurullar = db.Kurullar.Find(id);
            if (kurullar == null)
            {
                return HttpNotFound();
            }
            return View(kurullar);
        }

        // POST: Kurul/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "KurulID,Adi,Sponsoru,Baskani,Raportor,Amac,KayitTarihi,Gundem,SiraNo,BasTarihi,Sorumluluklar,IlgiliUstSurec,Politika")] Kurullar kurullar)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kurullar).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(kurullar);
        }

        // GET: Kurul/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kurullar kurullar = db.Kurullar.Find(id);
            if (kurullar == null)
            {
                return HttpNotFound();
            }
            return View(kurullar);
        }

        // POST: Kurul/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Kurullar kurullar = db.Kurullar.Find(id);
            db.Kurullar.Remove(kurullar);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }*/
    }
}
