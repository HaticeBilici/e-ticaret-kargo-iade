using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kargo.models
{
    public class iade
    {
        public int id { get; set; }
        public int iade_kodu { get; set; }
        public string iade_tarihi { get; set; }
        public string iade_firma { get; set; }
        public string iade_kisi { get; set; }
        public int musteri_lokasyon { get; set; }
        public string magaza_lokasyon { get; set; }
        public string iade_durumuu { get; set; }

    }
}