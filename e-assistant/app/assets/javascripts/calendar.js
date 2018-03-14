// $(document).ready(function() {
//     $('#calendar').fullCalendar({
//         events: '/events.json',
//         lang: 'ja',
//         defaultView: 'agendaWeek',
//         nowIndicator: true,
//         selectable: true,
//         selectHelper: true,
//         select: function(start, end, allDay) {
//             console.log('start:' + start);
//             console.log('end:' + end);
//             console.log('allDay:' + allDay);
//             alert('selected');
//         }
//     })
// });

$(document).ready(function() {
    var create = function(start, end) {
        var title = window.prompt("title");
        var data = {event: {title: title,
                            start: start.format(),
                            end: end.format(),
                            allDay: !start.hasTime()
                            }};
        $.ajax({
            type: "POST",
            url: "/events.json",
            data: data,
            success: function() {
                calendar.fullCalendar('refetchEvents');
            },
        });
        calendar.fullCalendar('unselect');
    };

    var update = function(event) {
        var data = {event: {title: event.title,
                            allDay: event.allDay,
                            start: moment(event.start).format(),
                            end: moment(event.end).format()
                            }};
        $.ajax({
            type: "PATCH",
            url: `/events/${event.id}.json`,
            data: data,
            success: function() {
                calendar.fullCalendar('refetchEvents');
            },
        });
        calendar.fullCalendar('unselect');
    };

    var calendar = $('#calendar').fullCalendar({
        events: '/events.json',
        lang: 'ja',
        defaultView: 'agendaWeek',
        nowIndicator: true,
        selectable: true,
        selectHelper: true,
        editable: true,
        snapDuration: '00:05:00',
        ignoreTimezone: false,
        select: create,
        eventDrop: update,
        eventResize: update,
        eventClick: function(calEvent, jsEvent, view) {
            alert('Event: ' + calEvent.title);
            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
            alert('View: ' + view.name);
            // change the border color just for fun
            $(this).css('border-color', 'red');
            return false;
        }
    });
});
