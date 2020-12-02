using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AssetUserManagement.Models
{
    public class UserModel
    {

        public  class User
        {
            public int UserID { get; set; }
            public string UserName { get; set; }
        }


        public List<User> UserCollection { get; set; }

        public class Dropdownlist
        {
            public List<User> userlist { get; set; }
        }
    }
}