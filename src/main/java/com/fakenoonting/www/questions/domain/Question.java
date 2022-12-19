package com.fakenoonting.www.questions.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Question {

    private Long questionId;
    private Long memberId;
    private Long productId;
    private String title;
    private String contents;
    private Timestamp regDate;
    private char isLock;
    private char isReplyExist;
    private char category;
    private String nickname;
}
