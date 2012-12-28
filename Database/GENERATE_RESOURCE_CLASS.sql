
declare @template varchar(MAX), @properties varchar(MAX)
set @template = '

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FTMatricula.Utilities.Helper
{
    public static class ModelResources
    {
        #PROPERTIES#

    }
}
'

SET @properties = ''


UPDATE [dbo].[Resource]
SET @properties = 
			@properties + '\t\tpublic static string '+ResourceKey+' { get { return Resources.GetValue("'+ResourceKey+'"); } }' + '\n'
 
 SET @template = REPLACE(@template,'#PROPERTIES#',@properties)
 
 print @template
