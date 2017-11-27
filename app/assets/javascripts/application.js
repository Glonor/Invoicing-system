// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require popper
//= require waves
//= require bootstrap-material-design
//= require moment
//= require fullcalendar


function clearCalendar() {
    $('#calendar').fullCalendar('delete'); // In case delete doesn't work.
    $('#calendar').html('');
};


$(document).on('turbolinks:load', function() {
    $('body').bootstrapMaterialDesign({});

    Waves.attach('.waves-start', ['waves-block']);
    Waves.init();

    $('#calendar').fullCalendar({
        height: 'auto',
        themeSystem: 'bootstrap3',
        columnFormat:'ddd D',
        titleFormat: 'MMMM YYYY',
        slotDuration: '01:00:00',
        slotLabelFormat: 'H:mm',
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectHelper: true,
        defaultView: 'agendaWeek',
        select: function(start, end) {
            $.ajax({
                type: "POST",
                dataType: "json",
                data: { "event": {
                        title: "testTitle",
                        description: "testDescription",
                        client_id: client_id,
                        start: start.toString(),
                        end: end.toString()
                    }},
                url: url,
                success: function(response){
                    console.log(response);
                    $('#calendar').fullCalendar('renderEvent', response, true);
                    $('#calendar').fullCalendar('unselect');
                    var element = document.getElementById("bill_button");
                    element.classList.remove("disabled");
                }
            });

        },
        eventLimit: true, // allow "more" link when too many events
        events: url,
        eventBackgroundColor: '#00838f',
        allDaySlot: false,
        bootstrapGlyphicons: false,
        eventRender: function(event, element) {
            if(event.billed == null) {
                element.css('background-color', '#757575');
            }
        },
    });
});

$(document).on('turbolinks:before-cache', clearCalendar)