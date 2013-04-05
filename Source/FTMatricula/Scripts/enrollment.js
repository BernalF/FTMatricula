/*
* Enrollment Javascript Class
*/
var enrollment = new Class({
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
                break;
            case 'CREATE':
                break;
            case 'EDIT':
                break;
            case 'GROUPS':
                break;
            case 'COURSES':
                this.fillGroupGrid();
                this.btnSaveSelectedCourses();
                this.addSchedule();
                break;
        }
    },
    //fill the Grid Group 
    fillGroupGrid: function () {
        $("#groups_grid").kendoGrid({
            dataSource: {
                data: null,
                pageSize: 10
            },
            sortable: true,
            columns: [{
                field: "Curso",
                width: 150,
                title: "Curso"
            }, {
                field: "Grupo",
                width: 100,
                title: "Grupo"
            }, {
                width: 200,
                field: "Hora"
            }, {
                field: "Aula",
                width: 100,
                title: "Aula"
            }
            ]
        });
    },
    //Save Selected Courses Handle
    btnSaveSelectedCourses: function () {
        var self = this;
        $('#btnSaveSelectedCourses').off('click.btnSaveSelectedCourses').on('click.btnSaveSelectedCourses', function () {
            $.ajaxSettings.traditional = true;
            var enrollmentCourses = [];
            $('input[name="EnrollmentCourse"]').each(function () {
                if ($(this).is(':checked')) {
                    enrollmentCourses.push($(this).attr('id'));
                }
            });
            var params = {
                EnrollmentID: $('#EnrollmentID').val(),
                EnrollmentCourses: enrollmentCourses
            };
            $.bAjax({
                url: self.options.urlSaveCourses,
                ajaxBeforeSend: function () {
                    $('.popupBg').fadeIn();
                    $('.loading').fadeIn();
                },
                data: params,
                datatype: "json",
                async: false,
                ajaxSuccess: function (response) {
                    $('.popupBg').fadeOut();
                    $('.loading').fadeOut();
                    //Do Somenthing 
                }
            });
            return false;
        });
    },
    //Add Schedule Handle Function
    addSchedule: function () {
        var self = this;
        $('#addSchedule').off('click.addSchedule').on('click.addSchedule', function () {
            var sTime = new StringBuilder();
            sTime.append($('#StartTimeH').parent().find('.k-formatted-value').val());
            sTime.append(':');
            sTime.append($('#StartTimeM').parent().find('.k-formatted-value').val());

            var eTime = new StringBuilder();
            eTime.append($('#EndTimeH').parent().find('.k-formatted-value').val());
            eTime.append(':');
            eTime.append($('#EndTimeM').parent().find('.k-formatted-value').val());

            var group = {
                ClassroomID: $('#ClassroomID').val(),
                ClassroomCode: $('#ClassroomID').data("kendoDropDownList").text(),
                Day: $('#Day').val(),
                StartTime: sTime.toString(),
                EndTime: eTime.toString(),
            };
            schedule_list.push(group);
            $('#scheduleGrid').html('');
            $.each(schedule_list, function (i, val) {
                var content = new StringBuilder();
                content.append('<li i="');
                content.append(i + 1);
                content.append('"><p>');
                content.append(val.ClassroomCode);
                content.append('</p></li>');
                content.append('<li i="');
                content.append(i + 1);
                content.append('"><p>');
                content.append(val.Day);
                content.append(' ');
                content.append(val.StartTime);
                content.append(' - ');
                content.append(val.EndTime);
                content.append('</p></li>');
                content.append('<li i="');
                content.append(i + 1);
                content.append('"><p>');
                content.append('<a href="#" class="delIcon" i="');
                content.append(i);
                content.append('" ');
                content.append('</a></p></li>');
                $("#scheduleGrid").append(content.toString());
            });
            $(".popupBg").delay(300).fadeOut(300);
            $('#addGroupWindow').fadeOut();
            self.deleteSchedule();
            return false;
        });
    },
    //Delete Schedule Handle Function
    deleteSchedule: function () {
        $('.delIcon').off('click.delIcon').on('click.delIcon', function () {
            schedule_list.splice($(this).attr('i'), 1);
            $('li[i=' + $(this).parent().parent().attr('i') + ']').remove();
        });
    }
});