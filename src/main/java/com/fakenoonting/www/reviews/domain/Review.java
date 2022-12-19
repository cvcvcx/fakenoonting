package com.fakenoonting.www.reviews.domain;

import com.fakenoonting.www.util.upload.vo.ImgReviewItemVo;
import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class Review {

    private Long reviewId;
    private Long memberId;
    private Long productId;
    private String contents;
    private Timestamp regDate;
    private int grade;
    private char isExist;
    private String nickname;
    private List<ImgReviewItemVo> reviewImgItems;
}


