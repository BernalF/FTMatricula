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
                this.enrollmentSelectCourse();
                break;
            case 'ENROLMENT':
                this.groupGrid();
                this.addCourse();
                break;
            case 'ENROLMENTINIT':
                this.submitForm();
                this.paymentNumberSave();
                break;
        }
    },
    //fill the Grid Details Group 
    fillGroupGrid: function (data) {
        var self = this;
        $("#groups_grid").kendoGrid({
            dataSource: {
                data: data,
                group: { field: 'GroupName' }
            },
            columns: [{
                field: "EnrollmentGroupID",
                hidden: true
            }, {
                field: "CourseCode",
                title: "Codigo"
            }, {
                field: "GroupName",
                title: "Grupo"
            }, {
                field: "ClassroomCode",
                title: "Aula"
            }, {
                field: "Schedule",
                title: "Horario"
            }, {
                field: "ProfessorName",
                title: "Profesor",
                width: 250
            }, {
                command: [{
                    name: "delete",
                    buttonType: "ImageAndText",
                    text: "Eliminar",
                    click: self.delGroup
                }]
            }],
            groupable: false
        });
    },
    delGroup: function (e) {
        var self = this;
        if (this.dataItem != undefined) {
            // e.target is the DOM element representing the button
            var tr = $(e.target).closest("tr"); // get the current table row (tr)
            // get the data bound to the current table row
            var data1 = this.dataItem(tr);
            $.ajaxSettings.traditional = true;
            $.bAjax({
                url: '/Enrollment/DeleteGroup',
                ajaxBeforeSend: function () {
                    $('.popupBg').fadeIn();
                    $('.loading').fadeIn();
                },
                data: {
                    EnrollmentGroupID: data1.EnrollmentGroupID,
                    EnrollmentID: $('#EnrollmentID').val(),
                    EnrollmentCourseID: $('.bgrYellow').children('input').attr('id')
                },
                async: false,
                ajaxSuccess: function (response) {
                    $('.popupBg').fadeOut();
                    $('.loading').fadeOut();
                    $("#groups_grid").data("kendoGrid").dataSource.data($.parseJSON(response));
                }
            });
        }
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
                DayOfWeek: $('#Day').val(),
                StartTime: sTime.toString(),
                EndTime: eTime.toString(),
            };
            EnrollSchedule.push(group);
            $('#scheduleGrid').html('');
            $.each(EnrollSchedule, function (i, val) {
                var content = new StringBuilder();
                content.append('<li i="');
                content.append(i + 1);
                content.append('"><p>');
                content.append(val.ClassroomCode);
                content.append('</p></li>');
                content.append('<li i="');
                content.append(i + 1);
                content.append('"><p>');
                content.append(val.DayOfWeek);
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
    deleteSchedule: function (all) {
        if (!all) {
            $('.delIcon').off('click.delIcon').on('click.delIcon', function () {
                EnrollSchedule.splice($(this).attr('i'), 1);
                $('li[i=' + $(this).parent().parent().attr('i') + ']').remove();
            });
        }
        else {
            EnrollSchedule = [];
            $('#scheduleGrid').html('');
        }
    },
    //Enrollment Select Course
    enrollmentSelectCourse: function () {
        var self = this;
        $('.checkSpace').off('click.checkSpace').on('click.checkSpace', function (e) {

            $('.whiteContentBox label').removeClass('bgrYellow');

            $(this).addClass('bgrYellow');

            var click = e.clientX - $(this).offset().left;

            if ((click >= 0) && (click <= 20)) {
                if ($(this).children('input').is(':checked')) {
                    $(this).addClass('hit');
                } else {
                    $(this).removeClass('hit');
                }
            }
            else if ((click >= 20)) {
                $('.detailBox ul').fadeIn();
                $('.detailBox100 ul').fadeIn();
                $('#Group_Name').val('');
                $('#Quota').parent().find('.k-formatted-value').val(30);
                $('#groupErrorArea').html('');
                //clean schedule List
                self.deleteSchedule(true);
                //Retrieve Groups List    
                self.retrieveGroups();
                //handle Add groups button
                self.addGroups();
                return false;
            }
            else {
                if ($(this).hasClass('hit')) {
                    $(this).children('input').prop('checked', true);
                } else {
                    $(this).children('input').prop('checked', false);
                }
            }
            // return false;
        });
    },
    //RetrievevGroups
    retrieveGroups: function () {
        var self = this;
        var params = {
            EnrollmentID: $('#EnrollmentID').val(),
            EnrollmentCourseID: $('.bgrYellow').children('input').attr('id')
        };
        $.ajaxSettings.traditional = true;
        $.bAjax({
            url: self.options.urlGetGroups,
            ajaxBeforeSend: function () {
                $('.popupBg').fadeIn();
                $('.loading').fadeIn();
            },
            data: JSON.stringify(params),
            datatype: "json",
            contentType: 'application/json; charset=utf-8',
            async: false,
            ajaxSuccess: function (response) {
                $('.popupBg').fadeOut();
                $('.loading').fadeOut();
                $("#groups_grid").data("kendoGrid").dataSource.data($.parseJSON(response));
            }
        });
    },
    //Add Groups
    addGroups: function () {
        var self = this;
        $('#btnAddGroup').off('click.btnAddGroup').on('click.btnAddGroup', function () {
            var EnrollGroup = {
                EnrollmentCourseID: $('.bgrYellow').children('input').attr('id'),
                GroupName: $('#Group_Name').val(),
                ProfessorID: $('#ProfessorID').val(),
                Quota: $('Quota').val,
                ScheduleList: EnrollSchedule
            };

            if (EnrollGroup.GroupName == '')
                $('#groupErrorArea').html('<li class="width100">' + self.options.GROUP_REQ + '</li>');
            else if (EnrollGroup.ScheduleList == '')
                $('#groupErrorArea').html('<li class="width100">' + self.options.SCHEDULE_REQ + '</li>');
            else {
                $('#groupErrorArea').html('');
                //Add new Groups
                $.ajaxSettings.traditional = true;
                $.bAjax({
                    url: self.options.urlAddGroups,
                    data: JSON.stringify(EnrollGroup),
                    datatype: "json",
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    ajaxSuccess: function (response) {
                        self.retrieveGroups();
                        $('#Group_Name').val('');
                        $('#Quota').parent().find('.k-formatted-value').val(30);
                        EnrollSchedule = [];
                        $('#scheduleGrid').html('');
                        //clean schedule List
                        self.deleteSchedule(true);
                    }
                });
            }
            return false;
        });
    },
    //Group Grids
    groupGrid: function () {
        $('.itemSpace').off('click.itemSpace').on('click.itemSpace', function (e) {
            $('.groupsGrid ul').fadeIn();
            $('#groupsGrid ul').fadeIn();
            $('#btnAddCourse').parent().fadeIn();

            $('.whiteContentBox label').removeClass('bgrYellow');
            $(this).addClass('bgrYellow');

            $('#groupsGrid').html('');
            var data = $.parseJSON($(this).attr('data'));
            if (data != null) {
                data = data.EnrollmentGroup;
                for (i = 0; i < data.length; i++) {
                    var g = "";
                    if (data[i].isFirst) {
                        g += "<li><p><input id='" + data[i].EnrollmentGroupID + "' type='radio' name='groups'/></p></li>";
                    } else {
                        g += "<li><p>&nbsp;</p></li>";
                    }
                    g += "<li><p>" + data[i].GroupName + "</p></li>";
                    g += "<li><p>" + data[i].ClassroomCode + "</p></li>";
                    g += "<li><p>" + data[i].Schedule + "</p></li>";
                    g += "<li><p>" + data[i].ProfessorName + "</p></li>";
                    $('#groupsGrid').append(g).hide().fadeIn();
                    $(this).closest('input').data(data[i]);
                }
            }
        });
    },
    //Add Course
    addCourse: function () {
        var self = this;
        $('#btnAddCourse').off('click.btnAddCourse').on('click.btnAddCourse', function () {
            if ($('#groupsGrid input[name=groups]:checked').attr('id') != undefined) {
                var tmpdata = $.parseJSON($('.itemSpace.bgrYellow').attr('data'));
                var data = [];

                data = self.findElement(tmpdata.EnrollmentGroup, 'EnrollmentGroupID', $('#groupsGrid input[name=groups]:checked').attr('id'));
                var inserted = true;
                $.each(data, function (i, val) {
                    if (i == 0) {

                        $.each(EnrollmentList, function (i, val) {
                            if (val.CourseID == $('.itemSpace.bgrYellow').attr('id')) {
                                alert('No se puede agregar el mismo curso más de una vez');
                                inserted = false;
                                return false;
                            }
                        });
                        if (inserted)
                            EnrollmentList.push({
                                CourseID: $('.itemSpace.bgrYellow').attr('id'),
                                EnrollmentGroupID: val.EnrollmentGroupID,
                                HTML: new StringBuilder()
                            });
                        else {
                            return false;
                        }
                    }
                    var rows = new StringBuilder();
                    rows.append('<li><p>');
                    rows.append(i == 0 ? $('.itemSpace.bgrYellow').text() : '&nbsp;');
                    rows.append('</p></li>');

                    rows.append('<li><p>' + val.GroupName + '</p></li>');
                    rows.append('<li><p>' + val.ClassroomCode + '</p></li>');
                    rows.append('<li><p>' + val.Schedule + '</p></li>');
                    rows.append('<li><p>' + val.ProfessorName + '</p></li>');
                    rows.append('<li><p>');
                    rows.append(i == 0 ? '<a href="#" class="delIcon" i="#INDEX#"></a>' : '&nbsp;');
                    rows.append('</p></li>');

                    EnrollmentList[EnrollmentList.length - 1].HTML.append(rows.toString());

                });
                if (inserted) {
                    $("#enrollmentGrid").append(EnrollmentList[EnrollmentList.length - 1].HTML.toString().replace("#INDEX#", (EnrollmentList.length - 1))).hide().fadeIn();

                    self.deleteEnrollmentGrid();
                    self.enrollmentAction();
                }
            }
            else {
                alert('Seleccione un grupo');
            }
            return false;
        });
    },
    //Find Element
    findElement: function (arr, propName, propValue) {
        result = [];
        for (var i = 0; i < arr.length; i++)
            if (arr[i][propName] == propValue)
                result.push(arr[i]);

        return result;
    },
    //Delete Enrollment Grid
    deleteEnrollmentGrid: function () {
        var self = this;
        $('.delIcon').off('click.delIcon').on('click.delIcon', function () {

            EnrollmentList.splice($(this).attr('i'), 1);

            $("#enrollmentGrid").html("");
            $.each(EnrollmentList, function (i, val) {
                $("#enrollmentGrid").append(val.HTML.toString().replace("#INDEX#", i)).hide().fadeIn();
            });
            self.deleteEnrollmentGrid();
            return false;
        });
    },
    enrollmentAction: function () {
        var self = this;
        $('#btnEnrollment').off('click.btnEnrollment').on('click.btnEnrollment', function () {
            var EnrollStudentGroup = [];
            $.each(EnrollmentList, function () {
                EnrollStudentGroup.push({
                    EnrollmentGroupID: this.EnrollmentGroupID,
                    StudentID: $('#Student_StudentID').val()
                });
            });            
            $.bAjax({
                url: self.options.urlEnrollemnt,
                ajaxBeforeSend: function () {
                    $('.popupBg').fadeIn();
                    $('.loading').fadeIn();
                },
                data: JSON.stringify(EnrollStudentGroup),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
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
    submitForm: function () {
        $('form').off('submit.form').on('submit.form', function () {
            $('.popupBg').fadeIn();
            $('.loading').fadeIn();
        });
    },
    paymentNumberSave: function () {
        var self = this;
        $('#btnAccept').off('click.btnAccept').on('click.btnAccept', function () {            
            $.ajaxSettings.traditional = true;
            $.bAjax({
                url: self.options.urlEnrollemnt,
                ajaxBeforeSend: function () {
                    $('.popupBg').fadeIn();
                    $('.loading').fadeIn();
                },
                data: {
                    EnrollmentID: $('#EnrollmentID').val(),
                    StudentID: $('#StudentID').val(),
                    PaymentNumber: $('#lblPayNum').val()
                },                
                async: false,
                ajaxSuccess: function (response) {
                    $('.popupBg').fadeOut();
                    $('.loading').fadeOut();
                    if (response = 'true') {
                        alert('Su pago a sido registrado correctamente');
                    }
                }
            });
            return false;
        });
    }

});