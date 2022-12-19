package com.fakenoonting.www.order.dao;

import com.fakenoonting.www.member.vo.MemberVO;

import com.fakenoonting.www.order.vo.OrdersVO;

import java.util.List;

public interface OrderDAO {

    int saveOrder(OrdersVO ordersVO);

    OrdersVO findOrderById(OrdersVO orderId);

    List<OrdersVO> findOrderListByMemberId(MemberVO memberId);

    int updateOrder(OrdersVO ordersVO);

    int deleteOrder(OrdersVO ordersVO);
}
