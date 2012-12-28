using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;

namespace FTMatricula.Utilities.Helper
{
    /// <summary>
    /// Cache Storage Service
    /// </summary>
    public class CacheStorageService : ICacheStorageService 
    {

        public T Get<T>(string key, Func<T> getItemCallback, int seconds = 0, int minutes = 0, int hours = 0) where T : class
        {
            T item = HttpRuntime.Cache.Get(key) as T;
            if (item == null)
            {
                item = getItemCallback();
                HttpRuntime.Cache.Insert(key,
                    item,
                    null,
                    System.Web.Caching.Cache.NoAbsoluteExpiration,
                    new TimeSpan(hours,minutes,seconds),
                    CacheItemPriority.Normal,
                    null);
            }
            return item;
        }

        public void Delete(string key)
        {
            HttpRuntime.Cache.Remove(key);
        }
        
        

    }

}
