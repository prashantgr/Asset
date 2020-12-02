using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AssetUserManagement.Models
{
    public class Utility
    {
        public class AssetType
        {
            public int AssetId { get; set; }
            public string AssetName { get; set; }
            public Asset Assets { get; set; }
        }

        public enum Asset
        {
            Male,
            Female
        }



     
    }
}