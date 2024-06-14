package com.typhoon0678.fullcalendarpractice;

import com.typhoon0678.fullcalendarpractice.dto.Calendar;

import java.util.ArrayList;
import java.util.Arrays;

public class Data {

    public static final ArrayList<Calendar> CALENDAR_DATA = new ArrayList<>(
            Arrays.asList(
                    Calendar.builder()
                            .id(1L)
                            .groupId(1L)
                            .title("rest")
                            .start("2024-06-01")
                            .build(),
                    Calendar.builder()
                            .groupId(2L)
                            .title("Long Event")
                            .start("2024-06-07")
                            .end("2024-06-10")
                            .build(),
                    Calendar.builder()
                            .id(3L)
                            .groupId(3L)
                            .title("Repeating Event")
                            .start("2024-06-09")
                            .build(),
                    Calendar.builder()
                            .id(4L)
                            .groupId(4L)
                            .title("Sample Event")
                            .start("2024-06-16")
                            .build(),
                    Calendar.builder()
                            .id(5L)
                            .groupId(1L)
                            .title("Conference")
                            .start("2024-06-11")
                            .end("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(6L)
                            .groupId(2L)
                            .title("Meeting")
                            .start("2024-06-12")
                            .build(),
                    Calendar.builder()
                            .id(7L)
                            .groupId(3L)
                            .title("Lunch")
                            .start("2024-06-12")
                            .build(),
                    Calendar.builder()
                            .id(8L)
                            .groupId(5L)
                            .title("Meeting")
                            .start("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(9L)
                            .groupId(1L)
                            .title("Happy Hour")
                            .start("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(10L)
                            .groupId(1L)
                            .title("Dinner")
                            .start("2024-06-14")
                            .build(),
                    Calendar.builder()
                            .id(11L)
                            .groupId(4L)
                            .title("Birthday Party")
                            .start("2024-06-14")
                            .build(),
                    Calendar.builder()
                            .id(12L)
                            .groupId(5L)
                            .title("Click for Google")
                            .start("2024-06-28")
                            .build()
            )
    );
}
