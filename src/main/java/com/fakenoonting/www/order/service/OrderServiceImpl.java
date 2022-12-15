package com.fakenoonting.www.order.service;

import com.fakenoonting.www.cart.dao.CartItemDAO;
import com.fakenoonting.www.cart.service.CartService;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.service.MemberServiceInterface;
import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.order.dao.OrderDAO;
import com.fakenoonting.www.order.vo.OrdersVO;
import com.fakenoonting.www.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @Autowired
    private MemberServiceInterface memberService;

    @Autowired
    private CartItemDAO cartItemDAO;

    @Autowired
    private OrderDAO orderDAO;

    /**
     * 카트에서 단일 항목을 구매하는 경우(선택항목 구매가 아닌 카트 아이템 우측에 있는 order버튼으로 구매시)
     * 
     * @param cartItemVO cartId와 count와 size가 들어가있는 cartItem을 받아온다.
     * @return 리스트화된 카트아이템을 반환한다.
     */
    @Override
    public List<CartItemVO> makeNewOrderByCartItemOrderBtn(CartItemVO cartItemVO) {
        List<CartItemVO> result = new ArrayList<>();
        CartItemVO cartItemByCartId = cartService.findCartItemByCartId(cartItemVO);
        // 상품의 개수를 변경한다.
        cartItemByCartId.setProductCount(cartItemVO.getProductCount());
        // 상품을 List에 넣어준다.
        result.add(cartItemByCartId);
        // CartItem을 업데이트한다.
        cartService.updateCartItem(result);
        return result;
    }

    /**
     * 상품 상세페이지에서 구매 버튼을 눌렀을 때, 새로운 cartItem을 생성하고, orderForm을 만든다.
     * 
     * @param cartItemVO productId, memberId, size, count를 가지고 있는 cartItem
     * @return 리스트화된 cartItem 반환
     */
    @Override
    public List<CartItemVO> makeNewOrderByProductDetailOrderBtn(CartItemVO cartItemVO) {
        List<CartItemVO> result = new ArrayList<>();
        // 새로운 카트아이템을 생성한다.
        cartService.addCartItem(cartItemVO);
        CartItemVO cartItemByCartId = cartService.findCartItemByCartId(cartItemVO);
        result.add(cartItemByCartId);

        return result;
    }

    /**
     * 카트에서 선택항목을 여러개 선택하고, 선택버튼을 눌렀을 때 구매하는 서비스
     * 
     * @param cartItemVO cartItemId, size, count, memberId를 리스트로 가지고있다.
     * @return 각 변수에 모두 값이 들어간 cartItem을 리스트화해서 반환한다.
     */
    @Override
    public List<CartItemVO> makeNewOrderByCartListOrderBtn(CartItemVO cartItemVO) {
        List<CartItemVO> cartItemVOList = cartItemVO.getCartItemVOList();
        ArrayList<CartItemVO> result = new ArrayList<>();

        // 장바구니에서 결제화면으로 넘어갈 때, 카트에 저장된 개수를 변경한다.
        cartService.updateCartItem(cartItemVOList);
        // cartItemByCartId를 사용해서 완성된 cartItem을 각 항목에 넣어준다.
        cartItemVOList.forEach(cartItemVO1 -> {
            result.add(cartService.findCartItemByCartId(cartItemVO1));
        });

        return result;
    }

    @Override
    public int saveOrder(OrdersVO ordersVO) {
        int result = orderDAO.saveOrder(ordersVO);

        log.info("saveOrder 실행중...");

        //카트아이템의 상태를 바꾸고, orderId를 추가한다.
        List<CartItemVO> cartItems = ordersVO.getCartItems();
        cartItems.forEach(cartItemVO -> {
            cartItemVO.setOrderId(ordersVO.getId());
        });
        cartService.updateCartItemToOrder(cartItems);
        //member의 소지 포인트를 조정한다.
        MemberVO memberVO = memberService.selectMemberById(ordersVO.getMemberId());
        memberVO.setMoney_point(memberVO.getMoney_point()-ordersVO.getPayPoint());

        memberService.updateMemberMoneyPoint(memberVO);

        return result;
    }

    @Override
    public List<CartItemVO> findCartItemListByOrderId(OrdersVO OrdersVO) {

        List<CartItemVO> result = new ArrayList<>();
        List<CartItemVO> cartItemVOList = cartItemDAO.findCartItemsByOrderId(OrdersVO);
        cartItemVOList.forEach(cartItemVO -> {
            CartItemVO cartItemByCartId = cartService.findCartItemByCartId(cartItemVO);
            result.add(cartItemByCartId);
        });

        return result;
    }


    @Override
    public List<CartItemVO> findOrderListByMemberId(MemberVO memberVO){

        return cartService.findCartItemsByMemberIdForOrder(memberVO);

    }
}
