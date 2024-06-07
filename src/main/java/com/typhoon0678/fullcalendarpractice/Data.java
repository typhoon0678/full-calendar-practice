package com.typhoon0678.fullcalendarpractice;

import com.typhoon0678.fullcalendarpractice.dto.Calendar;

import java.util.ArrayList;
import java.util.Arrays;

public class Data {

    public static final ArrayList<Calendar> CALENDAR_DATA = new ArrayList<>(
            Arrays.asList(
                    Calendar.builder()
                            .title("rest")
                            .start("2024-06-01")
                            .build(),
                    Calendar.builder()
                            .title("Long Event")
                            .start("2024-06-07")
                            .end("2024-06-10")
                            .build(),
                    Calendar.builder()
                            .groupId(999)
                            .title("Repeating Event")
                            .start("2024-06-09T16:00:00")
                            .build(),
                    Calendar.builder()
                            .groupId(999)
                            .title("Repeating Event")
                            .start("2024-06-16T16:00:00")
                            .build(),
                    Calendar.builder()
                            .title("Conference")
                            .start("2024-06-11")
                            .end("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .title("Meeting")
                            .start("2024-06-12T10:30:00")
                            .end("2024-06-12T12:30:00")
                            .build(),
                    Calendar.builder()
                            .title("Lunch")
                            .start("2024-06-12T12:00:00")
                            .build(),
                    Calendar.builder()
                            .title("Meeting")
                            .start("2024-06-12T14:30:00")
                            .build(),
                    Calendar.builder()
                            .title("Happy Hour")
                            .start("2024-06-12T17:30:00")
                            .build(),
                    Calendar.builder()
                            .title("Dinner")
                            .start("2024-06-12T20:00:00")
                            .build(),
                    Calendar.builder()
                            .title("Birthday Party")
                            .start("2024-06-13T07:00:00")
                            .build(),
                    Calendar.builder()
                            .title("Click for Google")
                            .url("https://google.com/")
                            .start("2024-06-28")
                            .build()
            )
    );
}
