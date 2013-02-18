/*
 * Author: Bernal Fernandez Rojas
 *
 * Description: Default error Callback funtion
 * 
 * Creation Date: March, 2012
 * 
 */
function defaultErrorCallback (jqXHR, textStatus){
    if (jqXHR.status === 0) {
        alert('Not connect.\n Verify Network.', jqXHR.status);                
    } else if (jqXHR.status == 404) {
        alert('Requested page not found.', jqXHR.status);                
    } else if (jqXHR.status == 500) {
        alert('Internal Server Error.', jqXHR.status);                
    } else if (textStatus === 'parsererror') {
        alert('Requested JSON parse failed.', jqXHR.status);                
    } else if (textStatus === 'timeout') {
        alert('Time out error.', jqXHR.status);                
    } else if (textStatus === 'abort') {
        alert('Ajax request aborted.', jqXHR.status);                
    } else {
        alert('Uncaught Error.\n', jqXHR.responseText);                
    }          
}

/*
 * Author: Bernal Fernandez Rojas
 * 
 * Description: Generic Function to execute Ajax Request with any action
 * 
 * Creation Date: July, 2012
 * 
 */
(function ($) {  
    var defaults = {
        eventType: '',
        eventNamespace: '',
        type: 'POST',
        url: '',
        data: {},
        cache: true,
        dataType: 'html',
        contentType: 'application/x-www-form-urlencoded',
        async: true,        
        ajaxBeforeSend: undefined,
        ajaxSuccess: undefined,
        ajaxError: undefined             
    }        
    $.extend({
        bAjax: function(options){
            var opts = $.extend({}, defaults, options);                               
            $.ajax({
                type : opts.type,
                url : opts.url,
                data : opts.data,
                beforeSend: function(xhr){
                    if (opts.ajaxBeforeSend != undefined)
                        opts.ajaxBeforeSend(xhr);                    
                },
                cache: opts.cache,
                dataType: opts.dataType,
                contentType: opts.contentType,
                async: opts.async,
                success: function(response){
                    if(opts.ajaxSuccess != undefined)
                        opts.ajaxSuccess (response);
                },
                error: function(jqXHR, textStatus){
                    (opts.ajaxError != undefined) ? opts.ajaxError(jqXHR, textStatus) : defaultErrorCallback(jqXHR, textStatus);                        
                }
            });                          
        }                                                         
    });            
    $.fn.extend({
        bAjax: function(options){
            var opts = $.extend({}, defaults, options);
            var button = $(this);                
            if(opts.eventType != ''){
                var evtNamespace = '';                
                (opts.eventNamespace == '') ? evtNamespace = button.attr('id') : evtNamespace = opts.eventNamespace;                                
                button.off(opts.eventType + '.' + evtNamespace).on(opts.eventType + '.' + evtNamespace, function(){                    
                    $.ajax({
                        type : opts.type,
                        url : opts.url,
                        data : opts.data,
                        beforeSend: function(xhr){
                            if (opts.ajaxBeforeSend != undefined)
                                opts.ajaxBeforeSend(xhr);                            
                        },
                        cache: opts.cache,
                        dataType: opts.dataType,
                        contentType: opts.contentType,
                        async: opts.async,
                        success: function(response){
                            if(opts.ajaxSuccess != undefined)
                                opts.ajaxSuccess (response);                            
                        },
                        error: function(jqXHR, textStatus){
                            (opts.ajaxError != undefined) ? opts.ajaxError(jqXHR, textStatus) : defaultErrorCallback(jqXHR, textStatus);                                                
                        }
                    });       
                });                    
            }                                
        }
    });                      
})(jQuery);


/*
* Author: Bernal Fernandez Rojas
* 
* Description: String Builder implementation in Javacript
* 
* Creation Date: March, 2012
* 
*/
//Initializes a new instance of the StringBuilder class and appends the given value if supplied
function StringBuilder(value) {
    this.strings = [];
    this.append(value);
}
//Appends the given value to the end of this instance.
StringBuilder.prototype.append = function(value) {
    if(value) {
        this.strings.push(value);
    }
}
//Clears the string buffer
StringBuilder.prototype.clear = function() {
    this.strings.length = 1;
}
//Converts this instance to a String.
StringBuilder.prototype.toString = function() {
    return this.strings.join('');
}