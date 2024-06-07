package com.typhoon0678.fullcalendarpractice.controller;

import com.google.gson.Gson;
import com.typhoon0678.fullcalendarpractice.Data;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/calendar/list")
public class CalendarList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        Gson gson = new Gson();
        out.println(gson.toJson(Data.CALENDAR_DATA));

        out.flush();
    }
}