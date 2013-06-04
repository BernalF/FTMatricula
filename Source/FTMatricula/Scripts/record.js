/*
* Record Javascript Class
*/
var record = new Class({
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
                this.recordSent();
                break;
        }
    },
    courseOnchanged: function () {
        var self = this;
        $('#btnRecord').fadeOut();
        $('#ddlCourseID').off('change.ddlCourseID').on('change.ddlCourseID', function () {
            $("#CourseID").val($("#ddlCourseID").val());
            var courseID = $("#ddlCourseID").val();
            if (courseID != '') {
                var grid = $("#Grid").data("kendoGrid");
                grid.dataSource.transport.options.read.url = "/Record/PagingRecords?CourseID=" + courseID;
                grid.dataSource.read();
                grid.refresh();

                $.bAjax({
                    url: 'ScoreRegister/GetScoreCriteriaByPlan',
                    data: { courseID: $(this).val() },
                    async: false,
                    ajaxSuccess: function (response) {
                        var result = $.parseJSON(response);
                        $('.scoreCriteria').fadeIn();
                        $($('.scoreCriteria').children('label').get(2)).html(result.ScoreCriteria);
                        $($('.scoreCriteria').children('label').get(3)).html(result.MinimumScore);
                    }
                });

                $.bAjax({
                    url: self.options.urlHasRecord,
                    ajaxBeforeSend: function () {
                        $('.popupBg').fadeIn();
                        $('.loading').fadeIn();
                    },
                    data: { CourseID: courseID },
                    async: false,
                    ajaxSuccess: function (response) {
                        $('.popupBg').fadeOut();
                        $('.loading').fadeOut();
                        //Do Somenthing
                        if (response == '1') {
                            $('#btnRecord').fadeOut();
                            $("#Grid").data("kendoGrid").dataSource.at(0).fields["RecordResult"].editable = false;

                        }
                        else {
                            $('#btnRecord').fadeIn();
                            $("#Grid").data("kendoGrid").dataSource.at(0).fields["RecordResult"].editable = true;
                        }
                    }
                });

            } else {
                $($('.scoreCriteria').children('label').get(2)).html('');
                $($('.scoreCriteria').children('label').get(3)).html('');
                $('.scoreCriteria').fadeOut();
                $('#btnRecord').fadeOut();                
                $("#Grid").data("kendoGrid").dataSource.data( { "Data": [{}], "Total": 1, "AggregateResults": null, "Errors": null });                
            }
        });
    },
    recordSent: function () {
        var self = this;
        $('#btnRecord').off('click.btnRecord').on('click.btnRecord', function () {
            if (confirm('La accion enviar a actas se realiza una unica vez\n\rEsta seguro que toda la informacion es correcta y quiere proceder??'))
            {
                $("#CourseID").val($("#ddlCourseID").val());
                var courseID = $("#ddlCourseID").val();
                $.bAjax({
                    url: self.options.urlRecord,
                    ajaxBeforeSend: function () {
                        $('.popupBg').fadeIn();
                        $('.loading').fadeIn();
                    },
                    data: { CourseID: courseID },
                    async: false,
                    ajaxSuccess: function (response) {
                        $('.popupBg').fadeOut();
                        $('.loading').fadeOut();
                        //Do Somenthing           
                        alert('El curso se proceso correctamente');
                        $('#btnRecord').fadeOut();
                    }
                });
            }                            
            return false;
        });
    }
});