<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.global.js"></script>
    <script src="${pageContext.request.contextPath}js/jquery-3.7.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
</head>
<body>

<div id='calendar'></div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
            themeSystem: 'bootstrap5',
            locale: 'ko',
            headerToolbar: {
                left: 'today',
                center: 'title',
                right: 'prev,next',
            },
            // initialDate: '2024-06-06',
            navLinks: false,

            editable: true,
            selectable: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events: {
                url: '/calendar/list',
                method: 'POST',
                failure: function () {
                    alert('there was an error while fetching events!');
                },
            }
        });

        calendar.render();
    });
</script>

</body>
</html>