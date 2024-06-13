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
                <h1 class="modal-title fs-5" id="modal-title">일정 추가</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="input-event-id" name="input-event-id">

                <div class="row m-3">
                    <label class="col-4" for="input-start-date">시작시간</label>
                    <input class="col-8" type="date" id="input-start-date" name="input-start-date">
                </div>
                <div class="row m-3">
                    <label class="col-4" for="input-end-date">종료시간</label>
                    <input class="col-8" type="date" id="input-end-date" name="input-end-date">
                </div>
                <div class="row m-3">
                    <label class="col-4" for="input-title">제목</label>
                    <input class="col-8" type="text" id="input-title" name="input-title">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="button-event-add">추가</button>
            </div>
        </div>
    </div>
</div>


<script>
    const modalTitle = $('#modal-title');
    const modalEventAdd = $('#modal-add-event');
    const inputEventId = $('#input-event-id');
    const inputStartDate = $('#input-start-date');
    const inputEndDate = $('#input-end-date');
    const inputTitle = $('#input-title');

    const buttonEventAdd = $('#button-event-add');

    let clickDate = '2024-06-01';
    let releaseDate = '2024-06-01';

    let tempId = 14;


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

            editable: true,
            selectable: true,
            eventDrop: function(info) {
                const event = {
                    id: info.event.id,
                    title: info.event.title,
                    start: stringToDate(info.event.start),
                    end: stringToDate(info.event.end)
                };

                $.ajax({
                    url: '/calendar/modify',
                    method: 'post',
                    data: {
                        'event': event,
                    },
                    success: function (res) {},
                    failure: function (res) {
                        alert(res.status);
                    }
                });
            },
            eventResize: function(info) {
                const event = {
                    id: info.event.id,
                    title: info.event.title,
                    start: stringToDate(info.event.start),
                    end: stringToDate(info.event.end)
                };

                $.ajax({
                    url: '/calendar/modify',
                    method: 'post',
                    data: {
                        'event': event,
                    },
                    success: function (res) {},
                    failure: function (res) {
                        alert(res.status);
                    }
                });
            },

            select: function (selectionInfo) {

                setModal(
                    '일정 추가',
                    '추가',
                    0,
                    stringToDate(selectionInfo.start),
                    stringToDate(selectionInfo.end),
                    ''
                );

                modalEventAdd.modal('toggle');
            },

            dayMaxEvents: true, // allow "more" link when too many events
            events: {
                url: '/calendar/list',
                method: 'POST',
                failure: function () {
                    alert('there was an error while fetching events!');
                },
            },
            eventClick: function (info) {
                setModal(
                    '일정 변경',
                    '변경',
                    info.event.id,
                    stringToDate(info.event.start),
                    stringToDate(info.event.end),
                    info.event.title
                );

                modalEventAdd.modal('toggle');
            },
        });

        calendar.render();


        buttonEventAdd.on('click', function () {

            if (modalTitle.text() === '일정 추가') {
                tempId++;
                console.log(tempId);
                const event = {
                    id: tempId,
                    title: inputTitle.val(),
                    start: inputStartDate.val(),
                    end: inputEndDate.val()
                };

                $.ajax({
                    url: '/calendar/add',
                    method: 'post',
                    data: {
                        'event': event,
                    },
                    success: function (res) {
                        calendar.addEvent(event);
                        alert(res.status);
                    },
                    failure: function (res) {
                        event.revert();
                        alert(res.status);
                    }
                });
            } else if (modalTitle.text() === '일정 변경') {
                console.log(inputEventId.val());
                const event = {
                    id: inputEventId.val(),
                    title: inputTitle.val(),
                    start: inputStartDate.val(),
                    end: inputEndDate.val()
                };

                $.ajax({
                    url: '/calendar/modify',
                    method: 'post',
                    data: {
                        'event': event,
                    },
                    success: function (res) {
                        calendar.removeAllEvents();
                        calendar.refetchEvents();
                        alert(res.status);
                    },
                    failure: function (res) {
                        alert(res.status);
                    }
                });
            }

            modalEventAdd.modal('toggle');
        });
    });

    function stringToDate(dateStr) {
        let date = new Date(dateStr);
        let year = date.getFullYear();
        let month = ("0" + (date.getMonth() + 1)).slice(-2); // Months are zero based
        let day = ("0" + date.getDate()).slice(-2);

        return year + '-' + month + '-' + day;
    }

    function setModal(title, buttonText, eventId, start, end, eventTitle) {
        modalTitle.text(title);
        buttonEventAdd.text(buttonText);
        inputEventId.val(eventId);
        inputStartDate.val(start);
        inputEndDate.val(end);
        inputTitle.val(eventTitle);
    }

    function modityEvent(event) {

    }

</script>

</body>
</html>