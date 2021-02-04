using System.Collections.Generic;
using System;

namespace FBE.Entities
{
    /// <summary>
    /// Fan data for a given fan at a given angle.
    /// Some fans will only have one angle while others will have many.
    /// </summary>
    [Serializable]
    public class FanData
    {
        /// <summary>
        /// Unique DB ID of this fandata entry.
        /// </summary>
        public int fanDataID = -1;

        /// <summary>
        /// Blade angle in degrees.
        /// </summary>
        public string angle;

        /// <summary>
        /// Reference back to parent fan object.
        /// </summary>
        public int fanID = -1;

        /// <summary>
        /// Power rating of motor in kilowatts
        /// </summary>
        public double motorkW;
        
        /// <summary>
        /// Current rating of motor in amps.
        /// </summary>
        public double motorAmps;

        public string impeller;
        public double mass;
        public double hz63;
        public double hz125;
        public double hz250;
        public double hz500;
        public double hz1k;
        public double hz2k;
        public double hz4k;
        public double hz8k;
        public double totalLwAtotal;

        /// <summary>
        /// 
        /// </summary>
        public double SPL3m;

        /// <summary>
        /// 
        /// </summary>
        public double RPM;

        /// <summary>
        /// Name of dimensional diagram
        /// </summary>
        public string dims;

        /// <summary>
        /// Name of wiring diagram
        /// </summary>
        public string wiring;
        public int motorID;
        public int casingID;

        public List<DataPoint> dataPointList = null;
        public DataPoint intercept = null;
        public Fan fanObject = null;
        public motorData motorDataObject = null;
        public Boolean bca2009;
        public Boolean bca2010;

        /// <summary>
        /// Default constructor
        /// </summary>
        public FanData()
        {
        }

        /// <summary>
        /// Constructor when fanDataID is known.
        /// </summary>
        /// <param name="fanDataID"></param>
        public FanData(int fanDataID)
        {
            this.fanDataID = fanDataID;
        }
    }
}
