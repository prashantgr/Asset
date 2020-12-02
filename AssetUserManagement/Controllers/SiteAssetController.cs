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
    public class SiteAssetController : Controller
    {
        private AssetManagementEntities db = new AssetManagementEntities();

        // GET: SiteAsset
        public ActionResult Index(string assetType)
        {



            var assetlist = from m in db.Site_Asset
                            select m;

            if (!String.IsNullOrEmpty(assetType) )
            {
                assetlist = db.Site_Asset.Where(s => s.Asset == assetType);
            }

            else
            {
                assetlist = db.Site_Asset;

            }
            return View( assetlist);
        }



        [HttpPost]
        public async Task<ActionResult> IndexSearch(string assetType)
        {

            return View(await db.Site_Asset.Where(s => s.Asset == assetType).ToListAsync());
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
