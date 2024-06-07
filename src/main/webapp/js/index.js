document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
        locale: 'ko',
        headerToolbar: {
            left: 'today',
            center: 'title',
            right: 'prev,next',
        },
        // initialDate: '2023-01-12',
        navLinks: false, // can click day/week names to navigate views
        nowIndicator: true,

        weekNumbers: true,
        weekNumberCalculation: 'ISO',

        editable: true,
        selectable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events: [
            {
                title: '휴식',
                start: '2024-06-01'
            },
            {
                title: 'Long Event',
                start: '2024-06-07',
                end: '2024-06-10'
            },
            {
                groupId: 999,
                title: 'Repeating Event',
                start: '2024-06-09T16:00:00'
            },
            {
                groupId: 999,
                title: 'Repeating Event',
                start: '2024-06-16T16:00:00'
            },
            {
                title: 'Conference',
                start: '2024-06-11',
                end: '2024-06-13'
            },
            {
                title: 'Meeting',
                start: '2024-06-12T10:30:00',
                end: '2024-06-12T12:30:00'
            },
            {
                title: 'Lunch',
                start: '2024-06-12T12:00:00'
            },
            {
                title: 'Meeting',
                start: '2024-06-12T14:30:00'
            },
            {
                title: 'Happy Hour',
                start: '2024-06-12T17:30:00'
            },
            {
                title: 'Dinner',
                start: '2024-06-12T20:00:00'
            },
            {
                title: 'Birthday Party',
                start: '2024-06-13T07:00:00'
            },
            {
                title: 'Click for Google',
                url: 'http://google.com/',
                start: '2024-06-28'
            }
        ]
    });

    calendar.render();
});