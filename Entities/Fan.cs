using System.Collections.Generic;
using System;

namespace FBE.Entities
{
    /// <summary>
    /// A Fan
    /// </summary>
    [Serializable]
    public class Fan
    {
        public int fanID = -1;
        public string partNumber { get; set; }
        public int diameter { get; set; }
        public int motorPhase { get; set; }
        public int motorPole { get; set; }
        public int fanSize;
        public int rangeID;
        public string fanImage;
        public string dims;
        public double mass;
        public int hubID;
        public int bladeMaterialID;

        public List<FanData> fanDataList = null;
        public Range rangeObject = null;
        public Hub hubObject = null;
        public BladeMaterial bladeMaterialObject = null;
        public FanType fanType;
    }
}
