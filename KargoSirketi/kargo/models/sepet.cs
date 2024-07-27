using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kargo.models
{
    public class sepet
    {
        public int id { get; set; }
        public int musteri_id { get; set; }
        public decimal birim_fiyat { get; set; }
        public decimal toplam_fiyat { get; set; }
    }
}