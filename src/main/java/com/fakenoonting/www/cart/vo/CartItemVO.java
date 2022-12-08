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

import org.springframework.stereotype.Component;



@Component("cartVO")
@Data
@NoArgsConstructor
public class CartItemVO {

	// Cart DB 존재 변수들
    private Long id;				// 카트 부분 개발자 쪽 구분 ID
    private Long memberId;			// Member 부분 개발자 쪽 구분 ID
    private Long productId;			// Product 부분 개발자 쪽 구분 ID
    private String productSize;		// Product 구매 사이즈
    private int productCount;		// Product 구매 갯수
    private Date createDate;		// Cart 에 담은 날짜
    
    // Cart DB 미 존재 변수들
    // 그저 보여주는 화면에 필요한 요소 (상품 이미지, 상품 제목, 상품 가격 등 필요하기 때문에)
    private ProductVO productVO;	// ProductVO 그 자체, 자세한 건 ProductVO 참고
    private String productImgPath;	// Product 이미지

}
