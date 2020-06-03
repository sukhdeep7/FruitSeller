using FruitSeller.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FruitSeller.Controllers
{
    public class SaleController : Controller
    {
        // GET: Sale
        FruitSellerEntities connect = new FruitSellerEntities();

        public ActionResult SaleList()
        {
            return View(connect.Sales.ToList());
        }

        // GET: Sale/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Sale/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Sale/Create
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "Id")] Sale data)
        {
            if (!ModelState.IsValid)
                return View();
            connect.Sales.Add(data);
            connect.SaveChanges();
            return RedirectToAction("SaleList");
        }

        // GET: Sale/Edit/5
        public ActionResult Edit(int id)
        {
            var editData = (from m in connect.Sales where m.id == id select m).First();
            return View(editData);
        }

        // POST: Sale/Edit/5
        [HttpPost]
        public ActionResult Edit(Sale EditData)
        {
            var orignalRecord = (from m in connect.Sales where m.id == EditData.id select m).First();

            if (!ModelState.IsValid)
                return View(orignalRecord);
            connect.Entry(orignalRecord).CurrentValues.SetValues(EditData);

            connect.SaveChanges();
            return RedirectToAction("SaleList");
        }

        // GET: Sale/Delete/5
        public ActionResult Delete(Sale DeleteData)
        {
            var d = connect.Sales.Where(x => x.id == DeleteData.id).FirstOrDefault();
            connect.Sales.Remove(d);
            connect.SaveChanges();
            return RedirectToAction("SaleList");

        }

        // POST: Sale/Delete/5
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
