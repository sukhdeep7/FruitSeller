using FruitSeller.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FruitSeller.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        FruitSellerEntities connect= new FruitSellerEntities();

        public ActionResult EmployeeList()
        {
            return View(connect.Employees.ToList());
        }

        // GET: Employee/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Employee/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Employee/Create
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "Id")] Employee data)
        {

            if (!ModelState.IsValid)
                return View();
            connect.Employees.Add(data);
            connect.SaveChanges();
            return RedirectToAction("EmployeeList");
        }

        // GET: Employee/Edit/5
        public ActionResult Edit(int id)
        {
            var editData = (from m in connect.Employees where m.id == id select m).First();
            return View(editData);
        }

        // POST: Employee/Edit/5
        [HttpPost]
        public ActionResult Edit(Employee EditData)
        {

            var orignalRecord = (from m in connect.Employees where m.id == EditData.id select m).First();

            if (!ModelState.IsValid)
                return View(orignalRecord);
            connect.Entry(orignalRecord).CurrentValues.SetValues(EditData);

            connect.SaveChanges();
            return RedirectToAction("EmployeeList");
        }

        // GET: Employee/Delete/5
        public ActionResult Delete(Employee DeleteData)
        {
            var d = connect.Employees.Where(x => x.id == DeleteData.id).FirstOrDefault();
            connect.Employees.Remove(d);
            connect.SaveChanges();
            return RedirectToAction("EmployeeList");

        }

        // POST: Employee/Delete/5
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
