using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace kargo.models
{
    public class siparisler
    {
        public int id { get; set; }
        public int sepet_id { get; set; }
        public int adres_id { get; set; }
        public DateTime siparis_tarihi { get; set; }
    }
}