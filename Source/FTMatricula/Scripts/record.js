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
        $('#ddlGroupID').off('change.ddlGroupID').on('change.ddlGroupID', function () {
            $("#GroupID").val($("#ddlGroupID").val());
            var GroupID = $("#ddlGroupID").val();
            if (GroupID != '') {
                var grid = $("#Grid").data("kendoGrid");
                grid.dataSource.transport.options.read.url = "/Record/PagingRecords?GroupID=" + GroupID;
                grid.dataSource.read();
                grid.refresh();

                $.bAjax({
                    url: 'ScoreRegister/GetScoreCriteriaByPlan',
                    data: { GroupID: $(this).val() },
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

                $.bAjax({
                    url: self.options.urlHasRecord,
                    ajaxBeforeSend: function () {
                        $('.popupBg').fadeIn();
                        $('.loading').fadeIn();
                    },
                    data: { GroupID: GroupID },
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
                $("#GroupID").val($("#ddlGroupID").val());
                var GroupID = $("#ddlGroupID").val();
                $.bAjax({
                    url: self.options.urlRecord,
                    ajaxBeforeSend: function () {
                        $('.popupBg').fadeIn();
                        $('.loading').fadeIn();
                    },
                    data: { GroupID: GroupID },
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