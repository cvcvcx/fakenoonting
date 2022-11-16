package com.fakenoonting.www.order.dao;

import com.fakenoonting.www.order.vo.OrderVO;

import java.util.List;

public interface OrderRepositoryInterface {

    public int save(OrderVO orderVO);
    public OrderVO findById(Long id);

    public List<OrderVO> findAllByMemberId(Long memberId);
}
