package com.fakenoonting.www.order.service;

import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.order.vo.OrdersVO;

import java.util.List;

public interface OrderService {

    // 오더 폼에 데이터를 넘길 때 세가지 경우가 있다.
    // cart.jsp에서 각자의 카트 항목에 붙어있는 order버튼으로 단일 항목을 사는 경우
    // productDetails.jsp 에서 Buy It Now 버튼으로 구매하는 경우
    // 카트에서 항목을 선택해서 여러개의 카트아이템을 구매하는 경우
    // 세가지 경우에 해당하는 서비스를 만들어야 한다.
    //
    // 리턴 타입이 List인 이유는 OrderForm.jsp뷰에서 아이템을 받아 뿌려주는 타입이
    public List<CartItemVO> makeNewOrderByCartItemOrderBtn(CartItemVO cartItemVO);

    public List<CartItemVO> makeNewOrderByProductDetailOrderBtn(CartItemVO cartItemVO);

    public List<CartItemVO> makeNewOrderByCartListOrderBtn(CartItemVO cartItemVO);

    public int saveOrder(OrdersVO ordersVO);
}
