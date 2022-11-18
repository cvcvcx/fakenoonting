package com.fakenoonting.www.order.dao;

import com.fakenoonting.www.order.vo.OrdersVO;

import java.util.List;

public interface OrderRepositoryInterface {

    public int save(OrdersVO ordersVO);
    public OrdersVO findById(Long id);
    public List<OrdersVO> findAllByMemberId(Long memberId);

    public OrdersVO updateOrderVO(OrdersVO ordersVO);

    public int deleteByOrderId(Long id);

}
