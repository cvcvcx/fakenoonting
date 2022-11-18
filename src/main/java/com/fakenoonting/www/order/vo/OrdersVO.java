package com.fakenoonting.www.order.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
import java.sql.Timestamp;

//멤버와 일대다 관계 -- 유저는 주문을 여러개 할 수 있음
@Getter
@Setter
@NoArgsConstructor
public class OrdersVO {
    //자동생성되는 키 == OrderItemVO에서
    private Long id;
    //주문한 멤버의 아이디(member_id)


    private Long memberId;
    //주문 날짜
    private Timestamp orderDate;
    //주문의 상태
    private Character status;


    public OrdersVO(Long memberId, Character status) {
        this.memberId = memberId;
        this.status = status;
    }
}
