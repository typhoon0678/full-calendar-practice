package com.typhoon0678.fullcalendarpractice.controller;

import com.google.gson.Gson;
import com.typhoon0678.fullcalendarpractice.Data;
import com.typhoon0678.fullcalendarpractice.dto.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/calendar/modify")
public class CalendarModify extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long id = Long.parseLong(req.getParameter("event[id]"));
        System.out.println("eventId: " + id);

        Data.CALENDAR_DATA.set(
                findIndex(id),
                Calendar.builder()
                        .id(id)
                        .title(req.getParameter("event[title]"))
                        .start(req.getParameter("event[start]"))
                        .end(req.getParameter("event[end]"))
                        .build());

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        Gson gson = new Gson();
        Map<String, String> response = new HashMap<>();

        if (true) {
            response.put("status", "success");
        } else {
            response.put("status", "failure");
        }
        out.println(gson.toJson(response));

        out.flush();
    }

    private int findIndex(long id) {
        for (int i=0; i<Data.CALENDAR_DATA.size(); i++) {
            if (Data.CALENDAR_DATA.get(i).getId() == id) {
                return i;
            }
        }

        return -1;
    }
}
