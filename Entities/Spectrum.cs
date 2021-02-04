using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FBE.Entities
{
    /// <summary>
    /// Sound spectrum composed of noise in dbA at set frequencies.
    /// The unit dbA refers to A-weighted decibels of sound pressure, referenced to 20 micropascals = 0 dB.
    /// </summary>
    public class Spectrum
    {
        /// <summary>
        /// Sound pressure level in dbA at 63 hertz.
        /// </summary>
        public double hz63;

        /// <summary>
        /// Sound pressure level in dbA at 125 hertz.
        /// </summary>
        public double hz125;

        /// <summary>
        /// Sound pressure level in dbA at 250 hertz.
        /// </summary>
        public double hz250;

        /// <summary>
        /// Sound pressure level in dbA at 500 hertz.
        /// </summary>
        public double hz500;

        /// <summary>
        /// Sound pressure level in dbA at 1000 hertz.
        /// </summary>
        public double hz1k;

        /// <summary>
        /// Sound pressure level in dbA at 2000 hertz.
        /// </summary>
        public double hz2k;

        /// <summary>
        /// Sound pressure level in dbA at 4000 hertz.
        /// </summary>
        public double hz4k;

        /// <summary>
        /// Sound pressure level in dbA at 8000 hertz.
        /// </summary>
        public double hz8k;

        /// <summary>
        /// Total in dbA.
        /// Obtained by converting the frequency into watts, adding them up and then converting back into db.
        /// </summary>
        public double total;
    }
}
