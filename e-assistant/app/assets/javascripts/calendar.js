$(document).ready(function() {
  var create = function(start, end) {
    var data = {event: {start: start.format(),
      end: end.format(),
      allDay: !start.hasTime()
    }};
    $.ajax({
      type: "GET",
      url: "/events/new.js",
      data: data
    }).done(function() {
      $(document).ready();
    });
    $('#id01').on('ajax:success', function(event) {
      calendar.fullCalendar('refetchEvents');
    });
    calendar.fullCalendar('unselect');
  };

  var update = function(event) {
    $.ajax({
      type: "GET",
      url: `/events/${event.id}/edit.js`
    }).done(function() {
      $(document).ready();
    });;
    $('#id01').on('ajax:success', function(event) {
      calendar.fullCalendar('refetchEvents');
    });
    calendar.fullCalendar('unselect');
  };

  var update_datetime = function(event) {
    var data = {event: {allDay: event.allDay,
      start: moment(event.start).format(),
      end: moment(event.end).format()
    }};
    $.ajax({
      type: "PATCH",
      url: `/events/${event.id}.json`,
      data: data,
      success: function() {
        calendar.fullCalendar('refetchEvents');
      }
    });
    calendar.fullCalendar('unselect');
  };

  var calendar = $('#calendar').fullCalendar({
    header: {
      left: 'today,prev,next',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
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
    eventClick: update,
    eventDrop: update_datetime,
    eventResize: update_datetime
  });
});
