package com.fakenoonting.www.cart.service;

import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;

import java.util.List;

public interface CartService {

    public int addCartItem(CartItemVO cartItemVO);

    CartItemVO findCartItemByCartId(CartItemVO cartItemVO);

    List<CartItemVO> findCartItemsByMemberId(MemberVO memberVO);

    //사용자는 카트에 올라간 상품의 개수를 조정할 수 있다.
    //상품이 결제화면을 올라갔을 때, 상품의 개수를 장바구니에 저장한다.
    public void updateCartItem(List<CartItemVO> cartItems);

    void updateCartItemToOrder(List<CartItemVO> cartItems);

    public int deleteCartItem(Long cartItemId);

}
