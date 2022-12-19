package com.fakenoonting.www.util.upload.vo;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ImgReviewItemVo {
    private String imgUUID;
    private Long reviewId;
    private Long productId;
    private String orgImgName;
    private String uploadPath;
    private Timestamp createDate;
}
