using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace carazonGarage.Models
{
    public class CustomerCar
    {
        public int Id { get; set; }
        public string CustomerName { get; set; }
        public string Phone { get; set; }
        public string Plate { get; set; }
        public string Car { get; set; }
        public string Status { get; set; }
    }
}
