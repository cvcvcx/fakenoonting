package com.fakenoonting.www.questions.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Data
@Component
public class Question {

    private int questionId;
    private int memberId;
    private int productId;
    private String title;
    private String contents;
    private Timestamp regDate;
    private char isLock;
    private char isReplyExist;
    private char category;
}
