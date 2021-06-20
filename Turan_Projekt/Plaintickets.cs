using System;
using System.Collections.Generic;
using System.Data;

namespace Turan_Projekt
{
   
    class Class1
    {

        public List<Data_manager> plaintickets = new List<Data_manager>();
      
        


        public void addArticle(Data_manager a)
        {
            plaintickets.Add(a);
        }


      
        public void removeArticle(Data_manager i)
        {
            plaintickets.Remove(i);
        }
       
        
        public double GetTotalPrice()
        {
            int total = 0;
            foreach (Data_manager p in plaintickets)
            {
                total += p.Flugpreis;
            }
            return total;

        }
    }
}