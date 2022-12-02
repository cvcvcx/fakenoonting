package com.fakenoonting.www.product.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor
public class ProductSize {
    private Long id;
    private Long productId;
    private String size;
    private Integer productCount;

    public ProductSize(Long productId, String size, Integer productCount) {
        this.productId = productId;
        this.size = size;
        this.productCount = productCount;
    }
}
