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
            $("#CourseID").val($("#ddlCourseID").val());
            var courseID = $("#ddlCourseID").val();
            var grid = $("#Grid").data("kendoGrid");
            grid.dataSource.transport.options.read.url = "/ScoreRegister/PagingScores?CourseID=" + courseID;
            grid.dataSource.read();
            grid.refresh();

        });
    }
});