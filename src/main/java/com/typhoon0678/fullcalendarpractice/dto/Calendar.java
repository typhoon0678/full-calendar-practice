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

    private long id;
    private long groupId; // event의 groupID 아님
    private String title;
    private String start;
    private String end;
}
