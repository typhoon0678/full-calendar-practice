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

        Gson gson = new Gson();
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        Calendar calendar = gson.fromJson(req.getReader(), Calendar.class);
        Data.CALENDAR_DATA.set(findIndex(calendar.getId()), calendar);

        Map<String, String> response = new HashMap<>();

        if (true) {
            resp.setStatus(HttpServletResponse.SC_OK);
            response.put("status", "success");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.put("status", "failure");
        }
        out.println(gson.toJson(response));

        out.flush();
    }

    private int findIndex(long id) {
        for (int i = 0; i < Data.CALENDAR_DATA.size(); i++) {
            if (Data.CALENDAR_DATA.get(i).getId() == id) {
                return i;
            }
        }

        return -1;
    }
}
