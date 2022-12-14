package com.fakenoonting.www.product.vo;

import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.util.List;

@Getter @Setter @ToString
@NoArgsConstructor
public class ProductVO {

    private Long id;
    private List<ImgItemVO> productImgItems;		// 썸네일 이미지 저장 변수 생성
    private List<ImgItemVO> productContentImgItems;	// 본문용 이미지 저장 변수 생성
    private String productName;						// 상품이름
    private Long price;								// 상품 가격
    private String content;							// 상품본문
    private Timestamp uploadDate;					// 업로드 날짜
    private Character productStatus;				// 상품의 현재 상태 (ex: 판매중, 재고없음, 판매종료)
    private Timestamp modifyDate;					// 수정 날짜
    private List<ProductSizeVO> productSizeList; 	// 상품 크기
    
}
