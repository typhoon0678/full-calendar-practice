package com.typhoon0678.fullcalendarpractice;

import com.typhoon0678.fullcalendarpractice.dto.Calendar;

import java.util.ArrayList;
import java.util.Arrays;

public class Data {

    public static final ArrayList<Calendar> CALENDAR_DATA = new ArrayList<>(
            Arrays.asList(
                    Calendar.builder()
                            .id(1L)
                            .title("rest")
                            .start("2024-06-01")
                            .build(),
                    Calendar.builder()
                            .id(2L)
                            .title("Long Event")
                            .start("2024-06-07")
                            .end("2024-06-10")
                            .build(),
                    Calendar.builder()
                            .id(3L)
                            .groupId(999)
                            .title("Repeating Event")
                            .start("2024-06-09T16:00:00")
                            .build(),
                    Calendar.builder()
                            .id(4L)
                            .groupId(999)
                            .title("Repeating Event")
                            .start("2024-06-16T16:00:00")
                            .build(),
                    Calendar.builder()
                            .id(5L)
                            .title("Conference")
                            .start("2024-06-11")
                            .end("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(6L)
                            .title("Meeting")
                            .start("2024-06-12T10:30:00")
                            .end("2024-06-12T12:30:00")
                            .build(),
                    Calendar.builder()
                            .id(7L)
                            .title("Lunch")
                            .start("2024-06-12T12:00:00")
                            .build(),
                    Calendar.builder()
                            .id(8L)
                            .title("Meeting")
                            .start("2024-06-12T14:30:00")
                            .build(),
                    Calendar.builder()
                            .id(9L)
                            .title("Happy Hour")
                            .start("2024-06-12T17:30:00")
                            .build(),
                    Calendar.builder()
                            .id(10L)
                            .title("Dinner")
                            .start("2024-06-12T20:00:00")
                            .build(),
                    Calendar.builder()
                            .id(11L)
                            .title("Birthday Party")
                            .start("2024-06-13T07:00:00")
                            .build(),
                    Calendar.builder()
                            .id(12L)
                            .title("Click for Google")
                            .url("https://google.com/")
                            .start("2024-06-28")
                            .build()
            )
    );
}
