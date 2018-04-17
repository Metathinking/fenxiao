package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.CartItem;
import com.hu.fenxiao.service.CartItemService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("member/cart")
public class CartController {

    @Autowired
    private CartItemService cartItemService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "front/cart";
    }

    @RequestMapping(value = "list",method = RequestMethod.POST)
    @ResponseBody
    public Tip getList(){
        List<CartItem> list = cartItemService.list(10001);//todo 模拟
        return new Tip(true,100,"",list);
    }

    /**
     * 商品加入购物车
     *
     * @param productId
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Tip addItem(@RequestParam String productId) {
        try {
            cartItemService.edit(10001, productId+"");//todo
            return new Tip(true, 100, "成功");
        } catch (Exception e) {
            return ExceptionTipHandler.handler(e);
        }
    }

    /**
     * 购物车商品增加一个
     *
     * @param productId
     * @return
     */
    @RequestMapping(value = "raise", method = RequestMethod.POST)
    @ResponseBody
    public Tip raise(@RequestParam String productId) {
        int quantity = cartItemService.raise(10001, productId);
        return new Tip(true, 100, quantity + "",quantity);
    }

    @RequestMapping(value = "reduce", method = RequestMethod.POST)
    @ResponseBody
    public Tip reduce(@RequestParam String productId) {
        int quantity = cartItemService.reduce(10001, productId);
        return new Tip(true, 100, quantity + "",quantity);
    }

    /**
     * 删除购物车商品
     *
     * @param cartItemId
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public Tip delete(@RequestParam String cartItemId) {
        try {
            cartItemService.delete(cartItemId);
            return new Tip(true, 100, "成功");
        } catch (Exception e) {
            return ExceptionTipHandler.handler(e);
        }
    }
}
