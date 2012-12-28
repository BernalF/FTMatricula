using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Runtime.Caching;

namespace FTMatricula.Utilities.Helper
{
    /// <summary>
    /// Cache Storage Service
    /// </summary>
    public class CacheStorageService : ICacheStorageService 
    {
        

        /// <summary>
        /// Get Data from Cache
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public object GetData(string key)
        {
            ObjectCache cache = MemoryCache.Default;

            if (cache.Contains(key))
            {
                return cache.Get(key);
            }
            else {
                return null;
            }
            
        }

        /// <summary>
        /// Set Data to Cache. Ex: SetData("key", "value", minutes: 30); 
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <param name="seconds"></param>
        /// <param name="minutes"></param>
        /// <param name="hours"></param>
        /// <returns></returns>
        public bool SetData(string key, object value, double seconds = 0, double minutes = 0, double hours = 0)
        {
            ObjectCache cache = MemoryCache.Default;

            CacheItemPolicy cacheItemPolicy = new CacheItemPolicy();
            DateTime expiration = DateTime.Now;

            expiration.AddSeconds(seconds);
            expiration.AddMinutes(minutes);
            expiration.AddHours(hours);

            cacheItemPolicy.AbsoluteExpiration = expiration;

            return cache.Add(key, value, cacheItemPolicy);
        }

    }

}
