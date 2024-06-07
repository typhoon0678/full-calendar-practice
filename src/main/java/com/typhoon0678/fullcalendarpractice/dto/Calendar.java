package com.typhoon0678.fullcalendarpractice.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Calendar {

    private Integer groupId;
    private String title;
    private String url;
    private String start;
    private String end;
}
