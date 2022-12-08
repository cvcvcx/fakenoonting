package com.fakenoonting.www.cart.service;

import com.fakenoonting.www.cart.dao.CartItemDAO;
import com.fakenoonting.www.cart.vo.CartItemVO;
import com.fakenoonting.www.member.vo.MemberVO;
import com.fakenoonting.www.product.dao.ProductDAO;
import com.fakenoonting.www.product.service.ProductService;
import com.fakenoonting.www.product.vo.ProductVO;
import com.fakenoonting.www.util.upload.vo.ImgItemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CartServiceImpl implements CartService{

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

    @Override
    public List<CartItemVO> findCartItemsByMemberId(MemberVO memberVO){

        List<CartItemVO> result=cartItemDAO.findCartItemsByMemberId(memberVO);
        result.forEach(cartItemVO -> {
            ProductVO productVO = new ProductVO();
            productVO.setId(cartItemVO.getProductId());
            ProductVO productVOById = productService.productDetail(productVO);
            cartItemVO.setProductVO(productVOById);
            ImgItemVO imgItemVO = productVOById.getProductImgItems().get(0);
            String imgPath = imgItemVO.getUploadPath()+"/s_"+imgItemVO.getImgUUID()+"_"+imgItemVO.getOrgImgName();
            cartItemVO.setProductImgPath(imgPath);
        });

        return result;
    }

    @Override
    public int deleteCartItem(CartItemVO cartItemVO){
        return cartItemDAO.deleteCartItem(cartItemVO);
    }

}
