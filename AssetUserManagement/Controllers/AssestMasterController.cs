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
using AssetUserManagement.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace AssetUserManagement.Controllers
{
    public class AssestMasterController : Controller
    {
        private AssetManagementEntities db = new AssetManagementEntities();

     
      
        public ActionResult Index(string assetType, int? assetNo,string statusType)
        {
            var assetlist = from m in db.Tbl_AssestMaster
                         select m;

            if (!String.IsNullOrEmpty(assetNo.ToString()) && String.IsNullOrEmpty(assetType) && String.IsNullOrEmpty(statusType))
            {
                assetlist = db.Tbl_AssestMaster.Where(s => s.AssetNo == assetNo );
            }
            else if(!String.IsNullOrEmpty(assetNo.ToString()) && !String.IsNullOrEmpty(assetType) && String.IsNullOrEmpty(statusType))
            {
                assetlist = db.Tbl_AssestMaster.Where(s => s.AssetType.Contains(assetType) && s.AssetNo == assetNo );
            }
            else if (!String.IsNullOrEmpty(assetNo.ToString()) && !String.IsNullOrEmpty(assetType) && !String.IsNullOrEmpty(statusType))
            {
                assetlist = db.Tbl_AssestMaster.Where(s => s.AssetType.Contains(assetType) && s.AssetNo == assetNo && s.Status.Contains(statusType));
            }

            else if (String.IsNullOrEmpty(assetNo.ToString()) && !String.IsNullOrEmpty(assetType) && String.IsNullOrEmpty(statusType))
            {
                assetlist = db.Tbl_AssestMaster.Where(s => s.AssetType.Contains(assetType));
            }
            else if (String.IsNullOrEmpty(assetNo.ToString()) && String.IsNullOrEmpty(assetType) && !String.IsNullOrEmpty(statusType))
            {
                assetlist = db.Tbl_AssestMaster.Where(s => s.Status.Contains(statusType));
            }



            return View(assetlist);
        }


        [HttpPost]
        public async Task<ActionResult> IndexSearch(int assetType)
        {

            return View(await db.Tbl_AssestMaster.Where(m=>m.AssetNo == assetType).ToListAsync());
        }

        // GET: AssestMaster/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tbl_AssestMaster tbl_AssestMaster = await db.Tbl_AssestMaster.FindAsync(id);
            if (tbl_AssestMaster == null)
            {
                return HttpNotFound();
            }
            return View(tbl_AssestMaster);
        }

        // GET: AssestMaster/Create
        public ActionResult Create()
        {
            var assetType = new SelectList(new[] { "Laptop", "iPad", "iPhone","Headset" });
            ViewBag.AssetType = assetType;

            var vendorType = new SelectList(new[] { "Apple", "Samsung"});
            ViewBag.VendorType = vendorType;

            var statusType = new SelectList(new[] { " In use", "Not working", "Returned" });
            ViewBag.StatusType = statusType;

            var items = db.Tbl_UserMaster.ToList();
            if (items != null)
            {
                ViewBag.UserData = items;
            }


            List<SelectListItem> userList = new List<SelectListItem>();
            //List<string> items = new List<string>();
            foreach (var item in items)
            {
                userList.Add(new SelectListItem
                {
                    Text = item.UserName.ToString(),
                    Value = item.UserName.ToString()
                });
            }

            ViewBag.UserList = userList;

            return View();
        }

        // POST: AssestMaster/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "AssetNo,AssetType,AssignedDate,WarrantyEndDate,RefreshOn,Status,AssetTaggedUser,Vendor,Remarks")] Tbl_AssestMaster tbl_AssestMaster)
        {
            if (ModelState.IsValid)
            {
                db.Tbl_AssestMaster.Add(tbl_AssestMaster);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(tbl_AssestMaster);
        }

        // GET: AssestMaster/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            var assetType = new SelectList(new[] { "Laptop", "iPad", "iPhone", "Headset" });
            ViewBag.AssetType = assetType;

            var vendorType = new SelectList(new[] { "Apple", "Samsung" });
            ViewBag.VendorType = vendorType;

            var statusType = new SelectList(new[] { " In use", "Not working", "Returned" });
            ViewBag.StatusType = statusType;

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tbl_AssestMaster tbl_AssestMaster = await db.Tbl_AssestMaster.FindAsync(id);


            ViewBag.SelectedVendorType = tbl_AssestMaster.Vendor;
            ViewBag.SelectedStatusType = tbl_AssestMaster.Status;
            ViewBag.SelectedAssetType = tbl_AssestMaster.AssetType;

            if (tbl_AssestMaster == null)
            {
                return HttpNotFound();
            }
            return View(tbl_AssestMaster);
        }

        // POST: AssestMaster/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "AssetNo,AssetType,AssignedDate,WarrantyEndDate,RefreshOn,Status,AssetTaggedUser,Vendor,Remarks")] Tbl_AssestMaster tbl_AssestMaster)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbl_AssestMaster).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(tbl_AssestMaster);
        }

        // GET: AssestMaster/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tbl_AssestMaster tbl_AssestMaster = await db.Tbl_AssestMaster.FindAsync(id);
            if (tbl_AssestMaster == null)
            {
                return HttpNotFound();
            }
            return View(tbl_AssestMaster);
        }

        // POST: AssestMaster/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Tbl_AssestMaster tbl_AssestMaster = await db.Tbl_AssestMaster.FindAsync(id);
            db.Tbl_AssestMaster.Remove(tbl_AssestMaster);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        // GET: DropDownlist

        public ActionResult DropDownControl()
        {
            UserModel.Dropdownlist multi_Dropdownlist = new UserModel.Dropdownlist
            {
                userlist = GetUserList()
            };

            return View(multi_Dropdownlist);
        }

        public List<UserModel.User> GetUserList()
        {
            var connection = ConfigurationManager.ConnectionStrings["AssestManagementConnection"].ToString();
            SqlConnection con = new SqlConnection(connection);
            SqlCommand cmd = new SqlCommand("SELECT [UserID],[UserName] FROM [AssestManagement].[dbo].[Tbl_UserMaster]", con);
            con.Open();
            SqlDataReader idr = cmd.ExecuteReader();
            List<UserModel.User> customers = new List<UserModel.User>();

            if (idr.HasRows)
            {
                while (idr.Read())
                {
                    customers.Add(new UserModel.User
                    {
                        UserID = Convert.ToInt32(idr["UserID"]),
                        UserName = Convert.ToString(idr["UserName"]),
                    });
                }
            }
            con.Close();
            return customers;
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
