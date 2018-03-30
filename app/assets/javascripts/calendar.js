function eventCalendar() {
  var create = function (start, end) {
    var data = {
      event: {
        start: start.format(),
        end: end.format(),
        allDay: !start.hasTime()
      }
    };
    $.ajax({
      type: "GET",
      url: "/events/new.js",
      data: data
    }).then(function () {
      $('#form-container').on('ajax:success', function () {
        calendar.fullCalendar('refetchEvents');
        calendar.fullCalendar('unselect');
      });
    });
  };

  var update = function (event) {
    $.ajax({
      type: "GET",
      url: `/events/${event.id}/edit.js`
    }).then(function () {
      $('#form-container').on('ajax:success', function () {
        calendar.fullCalendar('refetchEvents');
      });
    });
  };

  var update_datetime = function (event) {
    var data = {
      event: {
        allDay: event.allDay,
        start: moment(event.start).format(),
        end: moment(event.end).format()
      }
    };
    $.ajax({
      type: "PATCH",
      url: `/events/${event.id}.json`,
      data: data
    }).then(function () {
      calendar.fullCalendar('refetchEvents');
    });
  };


  var calendar = $('#calendar').fullCalendar({
    header: {
      left: 'today,prev,next',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    events: '/events.json',
    locale: 'ja',
    defaultView: 'month',
    height: 'auto',
    nowIndicator: true,
    selectable: true,
    selectHelper: true,
    editable: true,
    eventOverlap: false,
    snapDuration: '00:05:00',
    ignoreTimezone: false,
    select: create,
    eventClick: update,
    eventDrop: update_datetime,
    eventResize: update_datetime
  });

  return calendar;
};
function clearCalendar() {
  $('#calendar').fullCalendar('destroy'); // In case delete doesn't work.
  $('#calendar').html('');
};
$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)
