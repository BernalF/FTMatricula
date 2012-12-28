using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FTMatricula.Utilities.Helper
{
    /// <summary>
    /// ICache Storage Service 
    /// </summary>
    public interface ICacheStorageService 
    {
        /// <summary>
        /// Get Data from Cache
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        object GetData(string key);

        /// <summary>
        /// Set Data to Cache. Ex: SetData("key", "value", minutes: 30); 
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="seconds"></param>
        /// <param name="minutes"></param>
        /// <param name="hours"></param>
        /// <returns></returns>
        bool SetData(string key, object value, double seconds = 0, double minutes = 0, double hours = 0);
    }
}
