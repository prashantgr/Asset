using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AssetUserManagement;

namespace AssetUserManagement.Controllers
{
    public class UserRegisterController : Controller
    {
        private AssetManagementEntities db = new AssetManagementEntities();

      // GET: UserRegister/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserRegister/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "UserId,FirstName,LastName,Email,Password")] UserDetail userDetail)
        {
            if (ModelState.IsValid)
            {
                db.UserDetails.Add(userDetail);
                await db.SaveChangesAsync();
                return RedirectToAction("LogIn");
            }

            return View(userDetail);
        }


        // GET: Employees/Create
        public ActionResult LogIn(string UserName, string password)
        {

            string result = string.Empty;

            if (!String.IsNullOrEmpty(UserName) && !String.IsNullOrEmpty(password))
            {
                var userList = from m in db.UserDetails
                                where m.Email == UserName && m.Password == password
                                select m;
                if(userList.Count() >0)
                {
                    return RedirectToAction("Index", "Employees", new { area = "" });
                }
            }

            else
            {
              ViewBag.UserError = "Please enter credentials ";

            }

            return View();
        }

      

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
