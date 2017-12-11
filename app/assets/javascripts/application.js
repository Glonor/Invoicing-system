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
            right: 'month,agendaWeek'
        },
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectHelper: true,
        defaultView: 'agendaWeek',
        select: function(start, end) {
            var title = prompt("Please enter title event");
            var description = prompt("Please enter description");
            $.ajax({
                type: "POST",
                dataType: "json",
                data: { "event": {
                        title: title,
                        description: description,
                        client_id: client_id,
                        start_time: start.toString(),
                        end_time: end.toString()
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
        editable: true,
        eventOverlap: false,
        eventResize: function(event, delta, revertFunc) {
            if(!event.billed) {
                $.ajax({
                    type: "PATCH",
                    dataType: "json",
                    data: {
                        "event": {
                            start_time: event.start.toString(),
                            end_time: event.end.toString()
                        }
                    },
                    url: '/clients/' + event.client_id + '/events/' + event.id + '.json',
                    success: function (response) {
                        console.log(response);
                    },
                    error: function() {
                        revertFunc();
                    }
                });
            }
            else{
                revertFunc();
            }


        },
        eventDrop: function(event, delta, revertFunc) {
            if(!event.billed) {
                $.ajax({
                    type: "PATCH",
                    dataType: "json",
                    data: {
                        "event": {
                            start_time: event.start.toString(),
                            end_time: event.end.toString()
                        }
                    },
                    url: '/clients/' + event.client_id + '/events/' + event.id + '.json',
                    success: function (response) {
                        console.log(response);
                    },
                    error: function() {
                        revertFunc();
                    }
                });
            }else{
                revertFunc();
            }
        },
        eventLimit: true, // allow "more" link when too many events
        events: url,
        eventBackgroundColor: '#d84315',
        allDaySlot: false,
        selectOverlap: false,
        bootstrapGlyphicons: false,
        eventRender: function(event, element) {
            if(event.billed == null) {
                element.css('background-color', '#00838f');
            }
        },
        eventClick: function(event) {
            $('#modalTitle').html(event.title);
            $('#modalBody').html(event.description);
            $('#eventUrl').attr('href',event.url);
            $('#fullCalModal').modal();
            return false;
        }
    });
});

$(document).on('turbolinks:before-cache', clearCalendar)