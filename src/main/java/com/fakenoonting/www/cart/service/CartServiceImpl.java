package com.fakenoonting.www.cart.service;

import com.fakenoonting.www.cart.dao.CartItemDAO;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.product.dao.ProductDAO;
import com.fakenoonting.www.product.service.ProductService;
import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartItemDAO cartItemDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    private ProductService productService;

    @Override
    public int addCartItem(CartItemVO cartItemVO) {
        return cartItemDAO.addCartItem(cartItemVO);
    }


    //cartId만 가지고 모든 값을 가지고 있는 CartItemVO를 반환하는 함수
    @Override
    public CartItemVO findCartItemByCartId(CartItemVO cartItemId){
        ProductVO productVO = new ProductVO();
        //cartItemId로 찾아온 cartItemVO
        CartItemVO cartItemVO = cartItemDAO.findCartItemById(cartItemId);
        productVO.setId(cartItemVO.getProductId());

        ProductVO productVOById = productService.productDetail(productVO);
        cartItemVO.setProductVO(productVOById);
        ImgItemVO imgItemVO = productVOById.getProductImgItems().get(0);
        String imgPath = imgItemVO.getUploadPath()+"/s_"+imgItemVO.getImgUUID()+"_"+imgItemVO.getOrgImgName();
        //모든 항목을 가지고 있는 cartItemVO를 리턴
        cartItemVO.setProductImgPath(imgPath);
        return cartItemVO;
    }

    @Override
    public List<CartItemVO> findCartItemsByMemberId(MemberVO memberVO) {

        List<CartItemVO> cartItemVOList = cartItemDAO.findCartItemsByMemberId(memberVO);
        ArrayList<CartItemVO> result = new ArrayList<>();
        cartItemVOList.forEach(cartItemVO -> {
            result.add(findCartItemByCartId(cartItemVO));
        });

        return result;
    }


    //사용자는 카트에 올라간 상품의 개수를 조정할 수 있다.
    //상품이 결제화면을 올라갔을 때, 상품의 개수를 장바구니에 저장한다.
    @Override
    public void updateCartItem(List<CartItemVO> cartItems) {
        cartItems.forEach(cartItemVO -> {
            cartItemDAO.updateCartItem(cartItemVO);
        });

    }

    @Override
    public int deleteCartItem(Long cartItemId) {
        log.info("deleteCartItem 실행중...Service");
        return cartItemDAO.deleteCartItem(cartItemId);
    }


}
