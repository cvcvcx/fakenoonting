package com.fakenoonting.www.order.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

//멤버와 일대다 관계 -- 유저는 주문을 여러개 할 수 있음
@Getter
@Setter
@NoArgsConstructor
public class OrderVO {
    //자동생성되는 키 == OrderItemVO에서
    private Long id;
    //주문한 멤버의 아이디(member_id)
    private Long memberId;
    //주문 날짜
    private Date orderDate;
    //주문의 상태
    private Character status;


    public OrderVO(Long id, Long memberId, Date orderDate, Character status) {
        this.id = id;
        this.memberId = memberId;
        this.orderDate = orderDate;
        this.status = status;
    }
}
