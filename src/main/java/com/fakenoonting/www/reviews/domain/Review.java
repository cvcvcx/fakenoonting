package com.fakenoonting.www.reviews.domain;

import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

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
    //이미지 업로드시 지정해야할 변수명 -- reviewForm에 지정해줘야할 변수명
    private List<ImgItemVO> reviewImgItems;
}


