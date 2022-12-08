package com.fakenoonting.www.order.dao;

import com.fakenoonting.www.order.vo.OrderItemVO;

import java.util.List;

public interface OrderItemRepositoryInterface {

    public int save(OrderItemVO orderVO);
    public OrderItemVO findById(Long id);
    public List<OrderItemVO> findAllByOrderId(Long memberId);

    public OrderItemVO updateOrderVO(OrderItemVO orderItemVO);

    public int deleteByOrderItemId(Long id);

}
