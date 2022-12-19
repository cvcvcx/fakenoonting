package com.fakenoonting.www.order.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

//멤버와 일대다 관계 -- 유저는 주문을 여러개 할 수 있음
@Getter
@Setter
@NoArgsConstructor
public class OrdersVO {
    // 자동생성되는 키 == OrderItemVo에서 foreignKey로 사용
    private Long id;
    // 주문한 멤버의 아이디(member_id)
    private Long memberId;
    private String name;
    private String phone;
    private String address1;
    private String address2;
    private Integer zipcode;
    // 주문 날짜
    private Timestamp orderDate;
    // 주문의 상태
    private Character status;

    // Order 데이터베이스에는 존재하지 않지만, order를 봤을 때 필요한 항목
    private List<OrderItemVO> orderItems;
}
