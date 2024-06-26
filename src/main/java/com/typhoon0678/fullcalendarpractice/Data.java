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
                            .content("test content")
                            .start("2024-06-01")
                            .build(),
                    Calendar.builder()
                            .groupId(2L)
                            .title("Long Event")
                            .content("test content2")
                            .start("2024-06-07")
                            .end("2024-06-10")
                            .build(),
                    Calendar.builder()
                            .id(3L)
                            .groupId(3L)
                            .title("Repeating Event")
                            .content("test content3")
                            .start("2024-06-09")
                            .build(),
                    Calendar.builder()
                            .id(4L)
                            .groupId(4L)
                            .title("Sample Event")
                            .content("test content4")
                            .start("2024-06-16")
                            .build(),
                    Calendar.builder()
                            .id(5L)
                            .groupId(1L)
                            .title("Conference")
                            .content("test content5")
                            .start("2024-06-11")
                            .end("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(6L)
                            .groupId(2L)
                            .title("Meeting")
                            .content("test content6")
                            .start("2024-06-12")
                            .build(),
                    Calendar.builder()
                            .id(7L)
                            .groupId(3L)
                            .title("Lunch")
                            .content("test content7")
                            .start("2024-06-12")
                            .build(),
                    Calendar.builder()
                            .id(8L)
                            .groupId(5L)
                            .title("Meeting")
                            .content("test content8")
                            .start("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(9L)
                            .groupId(1L)
                            .title("Happy Hour")
                            .content("test content9")
                            .start("2024-06-13")
                            .build(),
                    Calendar.builder()
                            .id(10L)
                            .groupId(1L)
                            .title("Dinner")
                            .content("test content10")
                            .start("2024-06-14")
                            .build(),
                    Calendar.builder()
                            .id(11L)
                            .groupId(4L)
                            .title("Birthday Party")
                            .content("test content11")
                            .start("2024-06-14")
                            .build(),
                    Calendar.builder()
                            .id(12L)
                            .groupId(5L)
                            .title("Click for Google")
                            .content("test content12")
                            .start("2024-06-28")
                            .build(),
                    Calendar.builder()
                            .id(13L)
                            .title("My Schedule")
                            .content("test content13")
                            .start("2024-06-28")
                            .build(),
                    Calendar.builder()
                            .id(14L)
                            .title("My Schedule2222")
                            .content("test content14")
                            .start("2024-06-28")
                            .build()
            )
    );
}
