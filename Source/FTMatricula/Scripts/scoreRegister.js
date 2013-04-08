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
                //this.fillGroupGrid();                
                break;
        }
    },
    //fill the Grid Details Group 
    fillGroupGrid: function (data) {
        var self = this;
        $("#groups_grid").kendoGrid({
            dataSource: {
                data: data                
            },
            columns: [{
                field: "StudentID",
                hidden: true
            }, {
                field: "Name",
                title: "Nombre"
            }, {
                field: "LastName",
                title: "Apellido"
            }, {
                field: "Score",
                title: "Nota"
            }]            
        });
    }
});