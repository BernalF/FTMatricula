$(document).ready(function(){			   
	// INPUT FILE
	$('.fileHolder').append('<span class="fileText"></span>');
	$(".file").change(function(){
		$(this).closest(".fileHolder").children('.fileText').html($(this).val());
	});

	// INPUT CHECK
	$('.checkHolder').each(function (){
		$(this).click(function () {
			if ($(this).children('input').is(':checked')) {
				$(this).addClass('hit');
			} else {
				$(this).removeClass('hit');
			}
		});
	});
	
	// INPUT RADIO
	$('.radioHolder').each(function (){
		$(this).click(function () {
			var radioName = $(this).children('input').attr('name');
			var radioFinder = 'input[name="'+ radioName +'"]';
			if ($(this).children('input').is(':checked')) {
				$(radioFinder).closest('.radioHolder').removeClass('hit');
				$(this).addClass('hit');
			}
		});
	});

	
	// SELECT SET
	$('select.select').each(function(){
		if($('option:selected', this).val() != '' ){
			title = $('option:selected',this).text();
		} 
		$(this).after('<span class="selectText">' + title + '</span>');
		$(this).change(function () {
			$("option:selected", this).each(function () {
				title = $(this).text() + "";
			});
			$(this).closest('.selectHolder, .selectHolderMed, .selectHolderSmall').children('.selectText').html(title);
		}).change();
	});

});





function showError(error) {
    var error_str;
    switch (error.code) {
        case error.PERMISSION_DENIED:
            error_str = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            error_str = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            error_str = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            error_str = "An unknown error occurred."
            break;
    }
    document.getElementById('coords').innerHTML = error_str + "<br>error.message: " + error.message;
}
