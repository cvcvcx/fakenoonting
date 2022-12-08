package com.fakenoonting.www.cart.vo;

import com.fakenoonting.www.product.vo.ProductSizeVO;
import com.fakenoonting.www.product.vo.ProductVO;
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
    private String productSize;
    private Integer productCount;
    private Timestamp createDate;
    //아래는 cart 데이터베이스에는 존재하지 않지만, 보여주는 화면에 필요한 요소들임(필요한 것 상품이미지, 상품제목, 상품 가격이 필요하므로 productVO를 가져옴)
    private ProductVO productVO;
    private String productImgPath;

}
