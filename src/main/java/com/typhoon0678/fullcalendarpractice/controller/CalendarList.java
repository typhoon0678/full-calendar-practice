package com.typhoon0678.fullcalendarpractice.controller;

import com.google.gson.Gson;
import com.typhoon0678.fullcalendarpractice.dto.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/calendar/list")
public class CalendarList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        Gson gson = new Gson();
        out.println(gson.toJson(getCalendarList()));

        out.flush();
    }

    private List<Calendar> getCalendarList() {
        List<Calendar> calendarList = new ArrayList<>();

        calendarList.add(Calendar.builder()
                .title("rest")
                .start("2024-06-01")
                .build()
        );

        calendarList.add(Calendar.builder()
                .title("Long Event")
                .start("2024-06-07")
                .end("2024-06-10")
                .build()
        );

        calendarList.add(Calendar.builder()
                .groupId(999)
                .title("Repeating Event")
                .start("2024-06-09T16:00:00")
                .build());

        calendarList.add(Calendar.builder()
                .groupId(999)
                .title("Repeating Event")
                .start("2024-06-16T16:00:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Conference")
                .start("2024-06-11")
                .end("2024-06-13")
                .build());

        calendarList.add(Calendar.builder()
                .title("Meeting")
                .start("2024-06-12T10:30:00")
                .end("2024-06-12T12:30:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Lunch")
                .start("2024-06-12T12:00:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Meeting")
                .start("2024-06-12T14:30:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Happy Hour")
                .start("2024-06-12T17:30:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Dinner")
                .start("2024-06-12T20:00:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Birthday Party")
                .start("2024-06-13T07:00:00")
                .build());

        calendarList.add(Calendar.builder()
                .title("Click for Google")
                .url("https://google.com/")
                .start("2024-06-28")
                .build());

        return calendarList;
    }
}