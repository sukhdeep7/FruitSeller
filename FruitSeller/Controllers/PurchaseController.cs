using FruitSeller.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FruitSeller.Controllers
{
    public class PurchaseController : Controller
    {
        // GET: Purchase

        FruitSellerEntities connect = new FruitSellerEntities();

        public ActionResult PurchaseList()
        {
            return View(connect.Purchases.ToList());
        }

        // GET: Purchase/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Purchase/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Purchase/Create
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "Id")]Purchase data)
        {
            if (!ModelState.IsValid)
                return View();
            connect.Purchases.Add(data);
            connect.SaveChanges();
            return RedirectToAction("PurchaseList");

        }

        // GET: Purchase/Edit/5
        public ActionResult Edit(int id)
        {
            var editData = (from m in connect.Purchases where m.id == id select m).First();
            return View(editData);
        }

        // POST: Purchase/Edit/5
        [HttpPost]
        public ActionResult Edit(Purchase EditData)
        {
            var orignalRecord = (from m in connect.Purchases where m.id == EditData.id select m).First();

            if (!ModelState.IsValid)
                return View(orignalRecord);
            connect.Entry(orignalRecord).CurrentValues.SetValues(EditData);

            connect.SaveChanges();
            return RedirectToAction("PurchaseList");
        }

        // GET: Purchase/Delete/5
        public ActionResult Delete(Purchase DeleteData)
        {
            var d = connect.Purchases.Where(x => x.id == DeleteData.id).FirstOrDefault();
            connect.Purchases.Remove(d);
            connect.SaveChanges();
            return RedirectToAction("PurchaseList");
        }

        // POST: Purchase/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
