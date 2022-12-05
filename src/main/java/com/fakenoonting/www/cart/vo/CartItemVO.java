package com.fakenoonting.www.cart.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;


@Getter @Setter @ToString @NoArgsConstructor
public class CartItemVO {

    private Long id;
    private Long memberId;
    private Long productId;
    private Timestamp createDate;

}
