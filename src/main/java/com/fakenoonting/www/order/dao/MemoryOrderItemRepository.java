package com.fakenoonting.www.order.dao;

import com.fakenoonting.www.order.vo.OrderItemVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoryOrderItemRepository implements OrderItemRepositoryInterface{

    private static final Map<Long,OrderItemVO> store =  new HashMap<>();
    private static Long autoincrement =0L;

    @Override
    public int save(OrderItemVO orderItemVO) {
        autoincrement+=1;
        orderItemVO.setId(autoincrement);
        store.put(autoincrement,orderItemVO);
        return 0;
    }

    @Override
    public OrderItemVO findById(Long id) {
        return store.get(id);
    }

    @Override
    public List<OrderItemVO> findAllByOrderId(Long memberId) {
        List<OrderItemVO> result = new ArrayList<>();
         store.values().forEach(member-> {
            if(member.getOrderId().equals(memberId)){
                result.add(member);
            }
        });
        return result;
    }

    @Override
    public OrderItemVO updateOrderVO(OrderItemVO orderItemVO) {
        Long id = orderItemVO.getId();
        store.put(id,orderItemVO);
        return store.get(id);
    }

    @Override
    public int deleteByOrderItemId(Long id) {
        store.remove(id);
        return 0;
    }
}
