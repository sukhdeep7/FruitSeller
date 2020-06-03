using FruitSeller.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FruitSeller.Controllers
{
    public class HomeController : Controller
    {
        ConectDatabase instance = new ConectDatabase();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Login()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Correct()
        {
            return View();
        }
        public ActionResult Incorrect()
        {

            return View();
        }


        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult PostLogin(Login data) {
            string rspon = "select * from Admin where Name='"+data.txtName+"' and Password='"+data.txtPassword+"'";
            DataTable tbl = new DataTable();
            tbl = instance.dataRecord(rspon);
            if (tbl.Rows.Count > 0)
            {
                return View("Correct");
            }
            else {
                return View("Incorrect");
            }


        }
        public ActionResult PostMessage(feedBack data)
        {
            String respns = "insert into Contact(Name,Email,Contact,Message) values('"+data.txtName+"','"+data.txtEmail+"','"+data.txtPhone+"','"+data.txtMessage+"')";
            instance.Query(respns);
            return View("Redirect");


        }
    }
 }