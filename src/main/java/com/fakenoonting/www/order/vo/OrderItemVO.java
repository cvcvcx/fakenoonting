package com.fakenoonting.www.order.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class OrderItemVO {

    //자동으로 생성되는 이 테이블의 생성 키
    private Long id; //(name = "order_item_id",pk)
    //Order에 속하는 (Order)1 대 다(OrderItem) 관계
    private Long orderId; //(name = "order_id",fk)
    //상품과는 1:1관계가 된다. (OrderItem) 1 : 1 (Product)
    private Long productId;//(name = "product_id,fk)

    private Integer orderItemCount;
}
