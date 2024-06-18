<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calendar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/index.global.js"></script>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
</head>
<body>

<div id="div-group" class="d-flex gap-2 justify-content-center py-2"></div>

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
                <div class="row m-3">
                    <label class="col-4" for="input-content">내용</label>
                    <input class="col-8" type="text" id="input-content" name="input-content">
                </div>
                <div class="row m-3">
                    <label class="col-4" for="input-group">그룹</label>
                    <select class="col-8" type="text" id="input-group" name="input-group">
                    </select>
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
    const inputContent = $('#input-content');
    const inputGroup = $('#input-group');

    const buttonEventAdd = $('#button-event-add');

    const divGroup = $('#div-group');

    const colorArray = ['yellow', 'blue', 'green', 'purple', 'orange', 'red', 'skyblue', 'gray'];
    const textColorArray = ['black', 'white', 'white', 'white', 'black', 'white', 'black', 'black'];

    let groupIdArray = [];
    let hiddenGroupIdArray = [];
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

            dayMaxEvents: true, // allow "more" link when too many events
            editable: true,
            selectable: true,

            events: {
                url: '/calendar/list',
                method: 'POST',
                failure: function () {
                    alert('there was an error while fetching events!');
                },
            },
            eventDataTransform: function (eventData) {
                let id = eventData.groupId;
                if (!id) {
                    id = 0;
                }
                let colorIndex;

                if (!groupIdArray.includes(id)) {
                    groupIdArray.push(id);
                    inputGroup.append("<option value=\"" + id + "\">" + id + "</option>");
                    divGroup.append("<span id='span-group-" + id + "' class='badge d-flex align-items-center p-1 pe-2 text-primary-emphasis border border-secondary-subtle rounded-pill' style='font-size: 14px'>" +
                        +id + " sampleGroupName</button>");

                    $('#span-group-' + id).on('click', function () {
                        if ($(this).hasClass('hidden')) {
                            $(this).removeClass('hidden');
                            $(this).css('background', 'none');

                            hiddenGroupIdArray.splice(hiddenGroupIdArray.indexOf(id), 1);
                            console.log(hiddenGroupIdArray);

                            calendar.removeAllEvents();
                            calendar.refetchEvents();
                        } else {
                            $(this).addClass('hidden');
                            $(this).css('background-color', 'gray');

                            hiddenGroupIdArray.push(id);
                            console.log(hiddenGroupIdArray);

                            calendar.removeAllEvents();
                            calendar.refetchEvents();
                        }
                    });
                }

                colorIndex = groupIdArray.indexOf(id) % colorArray.length;

                return {
                    id: eventData.id,
                    groupId: eventData.id,
                    title: eventData.title,
                    start: eventData.start,
                    end: eventData.end,
                    extendedProps: {
                        groupId: id,
                        content: eventData.content
                    },
                    backgroundColor: colorArray[colorIndex],
                    textColor: textColorArray[colorIndex]
                };
            },
            // trigger when group toggle
            eventDidMount: function (info) {
                if (hiddenGroupIdArray.includes(info.event.extendedProps.groupId)) {
                    $(info.el).hide();
                } else {
                    $(info.el).show();
                }
            },
            select: function (selectionInfo) {
                setModal(
                    '일정 추가',
                    '추가',
                    0,
                    null,
                    stringToDate(selectionInfo.start),
                    stringToDate(selectionInfo.end),
                    '',
                    ''
                );

                modalEventAdd.modal('toggle');
            },
            eventClick: function (info) {
                setModal(
                    '일정 변경',
                    '변경',
                    info.event.id,
                    info.event.extendedProps.groupId,
                    stringToDate(info.event.start),
                    stringToDate(info.event.end),
                    info.event.title,
                    info.event.extendedProps.content
                );

                modalEventAdd.modal('toggle');
            },

            eventChange: function (info) {
                info.event.extendedProps.groupId = info.oldEvent.groupId;
                info.event.groupId = info.event.id;

                const event = {
                    id: info.event.id,
                    groupId: info.event.extendedProps.groupId,
                    title: info.event.title,
                    content: info.event.extendedProps.content,
                    start: stringToDate(info.event.start),
                    end: stringToDate(info.event.end)
                };

                fetch('/calendar/modify', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(event)
                })
                    .then(response => {
                        if (!response.ok) {
                            throw response;
                        }
                        return response.json();
                    })
                    .then(res => {
                        console.log(res);
                    })
                    .catch(error => {
                        console.log(error);
                        error.json().then(err => {
                            info.revert();
                            alert(err.status);
                        });
                    });
            }
        });

        calendar.render();


        buttonEventAdd.on('click', function () {

            if (modalTitle.text() === '일정 추가') {
                tempId++;
                console.log(tempId);

                const event = {
                    id: tempId,
                    groupId: inputGroup.val(),
                    title: inputTitle.val(),
                    content: inputContent.val(),
                    start: inputStartDate.val(),
                    end: inputEndDate.val()
                };


                fetch('/calendar/add', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(event)
                })
                    .then(response => {
                        if (!response.ok) {
                            throw response;
                        }
                        return response.json();
                    })
                    .then(res => {
                        calendar.removeAllEvents();
                        calendar.refetchEvents();
                        alert(res.status);
                    })
                    .catch(error => {
                        error.json().then(err => {
                            event.revert();
                            alert(err.status);
                        });
                    });
            } else if (modalTitle.text() === '일정 변경') {
                const event = {
                    id: inputEventId.val(),
                    groupId: inputGroup.val(),
                    title: inputTitle.val(),
                    content: inputContent.val(),
                    start: inputStartDate.val(),
                    end: inputEndDate.val()
                };

                fetch('/calendar/modify', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(event)
                })
                    .then(response => {
                        if (!response.ok) {
                            throw response;
                        }
                        return response.json();
                    })
                    .then(res => {
                        calendar.removeAllEvents();
                        calendar.refetchEvents();
                        alert(res.status);
                    })
                    .catch(error => {
                        error.json().then(err => {
                            alert(err.status);
                        });
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

    function setModal(title, buttonText, eventId, groupId, start, end, eventTitle, eventContent) {
        modalTitle.text(title);
        buttonEventAdd.text(buttonText);
        inputEventId.val(eventId);
        inputGroup.val(groupId);
        inputStartDate.val(start);
        inputEndDate.val(end);
        inputTitle.val(eventTitle);
        inputContent.val(eventContent);
    }

</script>

</body>
</html>