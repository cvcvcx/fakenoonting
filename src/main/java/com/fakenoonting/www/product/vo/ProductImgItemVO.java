package com.fakenoonting.www.product.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.List;


@Getter @Setter @NoArgsConstructor @ToString
public class ProductImgItemVO {
    private String imgUUID;
    private Long productId;
    private String orgImgName;
    private String uploadPath;


    private Timestamp createDate;

}
