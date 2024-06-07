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

<!-- Modal -->
<div class="modal fade" id="modal-add-event" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="h1-add-event-title">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                일정 추가
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="button-add-event">추가</button>
            </div>
        </div>
    </div>
</div>


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
            select: function (selectionInfo) {
                console.log(selectionInfo);
                $('#h1-add-event-title').text(selectionInfo.start);
                $('#modal-add-event').modal('toggle');
            },

            dayMaxEvents: true, // allow "more" link when too many events
            events: {
                url: '/calendar/list',
                method: 'POST',
                failure: function () {
                    alert('there was an error while fetching events!');
                },
            },
            eventClick: function () {
                console.log('clicked');
            }
        });

        calendar.render();


        $('#button-add-event').on('click', function () {
            const event = {
                title: 'temp Event',
                start: stringToDate($('#h1-add-event-title').text()),
            };

            $.ajax({
                url: '/calendar/add',
                method: 'post',
                data: {
                    'event': event,
                },
                success: function (res) {
                    calendar.refetchEvents();
                    alert(res.status);
                },
                failure: function (res) {
                    alert(res.status);
                }
            });

            $('#modal-add-event').modal('toggle');
        });
    });

    function stringToDate(dateStr) {
        var date = new Date(dateStr);
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2); // Months are zero based
        var day = ("0" + date.getDate()).slice(-2);

        return year + '-' + month + '-' + day;
    }

</script>

</body>
</html>