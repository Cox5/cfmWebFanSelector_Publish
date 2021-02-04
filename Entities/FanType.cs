using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FBE.Entities
{
    public class FanType
    {
        public int fanTypeID = -1;
        public string category;
        public string description;
        public int sortOrder = 0;

        public override string ToString()
        {
            return description;
        }
    }
}
