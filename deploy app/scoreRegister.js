/*
* Score Register Javascript Class
*/
var scoreRegister = new Class({
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
                this.courseOnchanged();                
                break;
        }
    },
    courseOnchanged: function () {        
        $('#ddlCourseID').off('change.ddlCourseID').on('change.ddlCourseID', function () {
            if ($(this).val() != "") {
                $.bAjax({
                    url: 'ScoreRegister/GetScoreCriteriaByPlan',
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

                $("#CourseID").val($("#ddlCourseID").val());
                var courseID = $("#ddlCourseID").val();
                var grid = $("#Grid").data("kendoGrid");
                grid.dataSource.transport.options.read.url = "/ScoreRegister/PagingScores?CourseID=" + courseID;
                grid.dataSource.read();
                grid.refresh();
            }
            else {
                $($('.scoreCriteria').children('label').get(2)).html('');
                $($('.scoreCriteria').children('label').get(3)).html('');
                $('.scoreCriteria').fadeOut();
            }
        });
    }
});