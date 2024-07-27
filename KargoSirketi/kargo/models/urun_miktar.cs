using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kargo.models
{
    public class urun_miktar
    {
        public int id { get; set; }
        public int sepet_id { get; set; }
        public int urun_id { get; set; }
        public decimal birim_fiyat { get; set; }
        public int miktar { get; set; }
    }
}