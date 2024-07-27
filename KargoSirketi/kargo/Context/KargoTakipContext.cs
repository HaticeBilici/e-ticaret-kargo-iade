using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace kargo.Context
{
    public class KargoTakipContext : DbContext

    {
        public KargoTakipContext() : base("name=kargo_takipConnectionString")
        {

        }
        public DbSet<models.Kargo> Kargo { get; set; }
        public DbSet<models.kargoBilgi> kargoBilgi { get; set; }
        public DbSet<models.KargoDurum> KargoDurum{ get; set; }
        public DbSet<models.personel> personel { get; set; }
        public DbSet<models.sepet> sepet { get; set; }
        public DbSet<models.siparisler> siparisler { get; set; }
        public DbSet<models.urun_miktar> urun_miktar { get; set; }
    }
} 