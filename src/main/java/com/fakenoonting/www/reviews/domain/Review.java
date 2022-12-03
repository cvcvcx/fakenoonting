package com.fakenoonting.www.reviews.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Data
@Component
public class Review {

    private int reviewId;
    private int memberId;
    private int productId;
    private String contents;
    private Timestamp regDate;
    private int grade;
    private char isExist;
}


