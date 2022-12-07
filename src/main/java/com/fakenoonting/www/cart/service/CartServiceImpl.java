package com.fakenoonting.www.cart.service;

import com.fakenoonting.www.cart.dao.CartItemDAO;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CartServiceImpl implements CartService{

    @Autowired
    private CartItemDAO cartItemDAO;

    @Override
    public int addCart(CartItemVO cartItemVO) {
        return cartItemDAO.addCartItem(cartItemVO);
    }

    @Override
    public List<CartItemVO> findCartItemsByMemberId(MemberVO memberVO){
        return cartItemDAO.findCartItemsByMemberId(memberVO);
    }

}
