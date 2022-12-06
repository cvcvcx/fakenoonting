package com.fakenoonting.www.product.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor
public class ProductSizeVO {
    private Long id;
    private Long productId;
    private String size;
    private Integer productCount;
}
