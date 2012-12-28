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
        T Get<T>(string key, Func<T> getItemCallback, int seconds = 0, int minutes = 0, int hours = 0) where T : class;
        void Delete(string key);

    }
}
