package com.fakenoonting.www.util.upload.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;


@Getter @Setter @NoArgsConstructor @ToString
public class ImgItemVO {
    private String imgUUID;
    private Long foreignId;
    private String orgImgName;
    private String uploadPath;


    private Timestamp createDate;


}
