package com.fakenoonting.www.product.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor
public class ProductSizeVO {
    private Long id;				// ProductSize 부분 개발자 쪽 구분 ID
    private Long productId;			// Product 부분 개발자 쪽 구분 ID
    private String size;			// 사이즈
    private Integer productCount;	// 각 사이즈 별 제품 갯수
}
