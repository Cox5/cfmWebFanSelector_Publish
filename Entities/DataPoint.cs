using System;

namespace FBE.Entities
{   
    /// <summary>
    /// A point in a fandata curve.
    /// </summary>
    [Serializable]
    public class DataPoint
    {
        /// <summary>
        /// Unique ID of this point in the database.
        /// </summary>
        public int dataPointID = -1;

        /// <summary>
        /// Airflow in litres per second. Used as the X coordinate on the performance and power graphs.
        /// </summary>
        public double airflow;

        /// <summary>
        /// Static pressure in pascals, Used at the Y coordinate on the performance graph.
        /// </summary>
        public double staticPressure;

        /// <summary>
        /// Reference back to the parent fandata object.
        /// </summary>
        public int fanDataID;

        /// <summary>
        /// Power in kilowatts at a given airflow. Used as the Y axis on the power graph.
        /// </summary>
        public double power;

        /// <summary>
        /// Noise level at a given airflow in dBA.
        /// </summary>
        public int noise;
    }
}
