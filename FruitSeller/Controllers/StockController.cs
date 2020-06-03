using FruitSeller.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FruitSeller.Controllers
{
    public class StockController : Controller
    {
        // GET: Stock
        FruitSellerEntities connect = new FruitSellerEntities();

        public ActionResult StockList()
        {
            return View(connect.Stocks.ToList());
        }

        // GET: Stock/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Stock/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Stock/Create
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "Id")] Stock data)
        {
            if (!ModelState.IsValid)
                return View();
            connect.Stocks.Add(data);
            connect.SaveChanges();
            return RedirectToAction("StockList");

        }

        // GET: Stock/Edit/5
        public ActionResult Edit(int id)
        {
            var editData = (from m in connect.Stocks where m.id == id select m).First();
            return View(editData);
        }

        // POST: Stock/Edit/5
        [HttpPost]
        public ActionResult Edit(Stock EditData)
        {
            var orignalRecord = (from m in connect.Stocks where m.id == EditData.id select m).First();

            if (!ModelState.IsValid)
                return View(orignalRecord);
            connect.Entry(orignalRecord).CurrentValues.SetValues(EditData);

            connect.SaveChanges();
            return RedirectToAction("StockList");
        }

        // GET: Stock/Delete/5
        public ActionResult Delete(Stock DeleteData)
        {
            var d = connect.Stocks.Where(x => x.id == DeleteData.id).FirstOrDefault();
            connect.Stocks.Remove(d);
            connect.SaveChanges();
            return RedirectToAction("StockList");


        }

        // POST: Stock/Delete/5
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
