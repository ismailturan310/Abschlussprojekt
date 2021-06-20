using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Turan_Projekt
{
    public class Data_manager
    {
        public Data_manager(string urlaubsziel, string @class, string fluggesellschaft, int flugpreis, DateTime abfahrt)
        {
            Urlaubsziel = urlaubsziel;
            Class = @class;
            Fluggesellschaft = fluggesellschaft;
            Flugpreis = flugpreis;
            Abfahrt = abfahrt;
        }


        public Data_manager()
        {

        }

        public string Urlaubsziel { get; set; }
        public string Class { get; set; }
        public string Fluggesellschaft { get; set; }
        public int Flugpreis { get; set; }
        public DateTime Abfahrt { get; set; }


    }


   


    
}
