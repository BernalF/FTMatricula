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
        $('#CourseID').off('change.CourseID').on('change.CourseID', function () {
            var courseID = $("#CourseID").val();    
            var grid = $("#Grid").data("kendoGrid");
            grid.dataSource.transport.options.read.url = "/ScoreRegister/PagingScores?CourseID=" + courseID;
            grid.dataSource.read();
            grid.refresh();

        });
    }
});