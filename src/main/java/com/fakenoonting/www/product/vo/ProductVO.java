package com.fakenoonting.www.product.vo;

//상품의 글
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter @Setter @ToString
public class ProductVO {

    private Long id;
    private String productName;//상품이름
    private Long price;//상품 가격
    private String content;//상품본문
    private Timestamp uploadDate;//업로드 날짜
    private Character productStatus;//상품의 현재 상태(ex: 판매중, 재고없음, 판매종료)
    private Timestamp modifyDate;//업로드 날짜

    public ProductVO(String productName, Long price, String content, Character productStatus) {
        this.productName = productName;
        this.price = price;
        this.content = content;
        this.productStatus = productStatus;
    }
}
