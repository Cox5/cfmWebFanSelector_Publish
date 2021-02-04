using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FBE.Entities
{
    [Serializable]
    public class Range
    {
        public int rangeID = -1;
        public string rangeName;
        public int oldRangeType;
        public string rangeDescription;
        public int sortOrder;
        public bool obsolete = false;
        public int impellerTypeID;
        public int installationTypeID;

        public ImpellerType impellerTypeObject = null;
        public InstallationType installationTypeObject = null;
    }
}
