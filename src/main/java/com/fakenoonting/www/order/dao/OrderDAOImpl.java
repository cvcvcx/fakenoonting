package com.fakenoonting.www.order.dao;

import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.order.vo.OrdersVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @Autowired
    private SqlSession sqlSession;
    private String nameSpace = "com.fakenoonting.order";

    @Override
    public int saveOrder(OrdersVO ordersVO) {
        return sqlSession.insert(nameSpace + ".saveOrder", ordersVO);
    }

    @Override
    public OrdersVO findOrderById(OrdersVO orderId) {
        return sqlSession.selectOne(nameSpace + ".findOrderById", orderId);
    }

    @Override
    public List<OrdersVO> findOrderListByMemberId(MemberVO memberId) {

        return sqlSession.selectList(nameSpace + ".findOrderListByMemberId", memberId);
    }

    @Override
    public int updateOrder(OrdersVO ordersVO) {
        return sqlSession.update(nameSpace + ".updateOrder", ordersVO);
    }

    @Override
    public int deleteOrder(OrdersVO ordersVO) {
        return sqlSession.delete(nameSpace + ".deleteOrder", ordersVO);
    }

}
