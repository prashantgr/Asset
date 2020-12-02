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
    public class UserMasterController : Controller
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        // GET: UserMaster
        public async Task<ActionResult> Index()
        {
            return View(await db.Tbl_UserMaster.ToListAsync());
        }

        // GET: UserMaster/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tbl_UserMaster tbl_UserMaster = await db.Tbl_UserMaster.FindAsync(id);
            if (tbl_UserMaster == null)
            {
                return HttpNotFound();
            }
            return View(tbl_UserMaster);
        }

        // GET: UserMaster/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserMaster/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "UserID,UserName,UserAddress")] Tbl_UserMaster tbl_UserMaster)
        {
            if (ModelState.IsValid)
            {
                db.Tbl_UserMaster.Add(tbl_UserMaster);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(tbl_UserMaster);
        }

        // GET: UserMaster/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tbl_UserMaster tbl_UserMaster = await db.Tbl_UserMaster.FindAsync(id);
            if (tbl_UserMaster == null)
            {
                return HttpNotFound();
            }
            return View(tbl_UserMaster);
        }

        // POST: UserMaster/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "UserID,UserName,UserAddress")] Tbl_UserMaster tbl_UserMaster)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbl_UserMaster).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(tbl_UserMaster);
        }

        // GET: UserMaster/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tbl_UserMaster tbl_UserMaster = await db.Tbl_UserMaster.FindAsync(id);
            if (tbl_UserMaster == null)
            {
                return HttpNotFound();
            }
            return View(tbl_UserMaster);
        }

        // POST: UserMaster/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Tbl_UserMaster tbl_UserMaster = await db.Tbl_UserMaster.FindAsync(id);
            db.Tbl_UserMaster.Remove(tbl_UserMaster);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
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
