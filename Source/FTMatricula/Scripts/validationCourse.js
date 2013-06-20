/*
* Validation Course Javascript Class
*/
var validationCourse = new Class({
    Implements: [Options],
    options: {},
    //Initialize Function
    initialize: function (options) {
        this.setOptions(options);
        this.PageLoad();
    },
    //Decides which function load according to the View
    PageLoad: function () {
        switch (this.options.view) {            
            case 'INDEX':
                this.searchStudent();
                break;
        }
    },
    searchStudent: function () {
        var self = this;
        $.bAjax({
            url: 'ValidationCourseController/SearchStudent',
            data: { courseID: $(this).val() },
            async: false,
            ajaxSuccess: function (response) {
                var result = $.parseJSON(response);
                if (result != null) {
                    $('.scoreCriteria').fadeIn();
                    $($('.scoreCriteria').children('label').get(1)).html('El Criterio de calificación es: ');
                    $($('.scoreCriteria').children('label').get(2)).html(result.ScoreCriteria);
                    $($('.scoreCriteria').children('label').get(3)).html(result.MinimumScore);
                }
                else {
                    $('.scoreCriteria').fadeIn();
                    $($('.scoreCriteria').children('label').get(1)).html('El Curso no posee Criterio de Calificacion, Por favor ir al mantenimientos de cursos!');
                }
            }
        });
    }
});