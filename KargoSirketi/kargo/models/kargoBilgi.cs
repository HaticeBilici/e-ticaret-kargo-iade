using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kargo.models
{
    public class kargoBilgi
    {
        public int id { get; set; }
        public string takip_no { get; set; }
        public string gonderen { get; set; }
        public string alici { get; set; }
        public string durum { get; set; }
        public string lokasyon { get; set; }
        public DateTime tarih{ get; set; }
        public string teslim_alan { get; set; }
      
        public string gonderi_no { get; set; }
        public int siparis_no { get; set; }

        internal static IEnumerable<object> Where(Func<object, bool> p)
        {
            throw new NotImplementedException();
        }
    }
}