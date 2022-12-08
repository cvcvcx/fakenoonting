package com.fakenoonting.www.cart.dao;

import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartItemDAO {

    @Autowired
    SqlSession sqlSession;

    String nameSpace = "com.fakenoonting.cartItem";

    public int addCartItem(CartItemVO cartItemVO) {
        return sqlSession.insert(nameSpace + ".addCartItem", cartItemVO);
    }

    public List<CartItemVO> findCartItemsByMemberId(MemberVO memberVO) {
        return sqlSession.selectList(nameSpace + ".findCartItemsByMemberId", memberVO);
    }

    public int deleteCartItem(Long cartItemId) {
        return sqlSession.delete(nameSpace + ".deleteCartItem", cartItemId);
    }

}
