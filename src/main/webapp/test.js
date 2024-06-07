var calendar = new Calendar(calendarEl, {
  events: [
    {
      title: 'My Event',
      start: '2010-01-01',
      url: 'https://google.com/'
    }
    // other events here
  ],
  eventClick: function(info) {
    info.jsEvent.preventDefault(); // don't let the browser navigate

    if (info.event.url) {
      window.open(info.event.url);
    }
  }
});