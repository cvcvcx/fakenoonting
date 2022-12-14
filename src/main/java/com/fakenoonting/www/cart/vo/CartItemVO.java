package com.fakenoonting.www.cart.vo;

import com.fakenoonting.www.product.vo.ProductSizeVO;
import com.fakenoonting.www.product.vo.ProductVO;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

@Component("cartVO")
@Data
@NoArgsConstructor
public class CartItemVO {

    // Cart DB 존재 변수들
    private Long id; // 카트 부분 개발자 쪽 구분 ID
    private Long memberId; // Member 부분 개발자 쪽 구분 ID
    private Long productId; // Product 부분 개발자 쪽 구분 ID
    private Long orderId; // 만약 주문상태라면, 값이 들어가게 된다. 기본 값은 null;
    private String productSize; // Product 구매 사이즈
    private Integer productCount; // Product 구매 갯수
    private Date createDate; // Cart 에 담은 날짜
    private Character status;// Cart에 담겨있는지, Order들어있는지 알 수 있는 상태 C -> 카트 O -> Order
    // Cart DB 미 존재 변수들
    // 그저 보여주는 화면에 필요한 요소 (상품 이미지, 상품 제목, 상품 가격 등 필요하기 때문에)
    private ProductVO productVO; // ProductVO 그 자체, 자세한 건 ProductVO 참고
    private String productImgPath; // Product 이미지

    //
    private List<CartItemVO> cartItemVOList;

}
