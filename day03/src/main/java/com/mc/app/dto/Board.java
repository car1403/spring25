package com.mc.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Board {
    private int boardId;
    private String boardTitle;
    private String boardContent;
    private String boardAuthor;
    private int boardHit;
    private Date boardrdate;
    private Date boardudate;
}
