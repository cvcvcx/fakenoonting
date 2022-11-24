package com.fakenoonting.www.cart.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;


@Getter @Setter @ToString @NoArgsConstructor
public class cartItemVO {

    private Long id;
    private Long memberId;
    private Long productId;
    private Timestamp createDate;

    public cartItemVO(Long memberId, Long productId) {
        this.memberId = memberId;
        this.productId = productId;
    }

}
