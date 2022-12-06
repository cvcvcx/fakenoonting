package com.fakenoonting.www.cart.vo;

import com.fakenoonting.www.product.vo.ProductSizeVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;


@Getter @Setter @ToString @NoArgsConstructor
public class CartItemVO {
//장바구니로 이동할 때, 만들어서 보내야하는 VO 폼에서 이 값을 name으로 받아와야 한다.
    private Long id;
    private Long memberId;
    private Long productId;
    private ProductSizeVO productSizeVO;
    private Integer productCount;
    private Timestamp createDate;

}
