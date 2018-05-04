package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.controller.admin.AdminTuiGuangSettingController;
import com.hu.fenxiao.domain.CartItem;
import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.service.CartItemService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("member/cart")
public class CartController {

    private Logger logger = LogManager.getLogger(AdminTuiGuangSettingController.class);

    @Autowired
    private CartItemService cartItemService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("sign", "cart");
        return "front/cart";
    }

    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ResponseBody
    public Tip getList(HttpSession session) {
        List<CartItem> list = null;
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            list = cartItemService.list(member.getId());
            return new Tip(true, 100, "", list);
        } catch (Exception e) {
            logger.error("", e);
            e.printStackTrace();
            return ExceptionTipHandler.handler(e);
        }

    }

    /**
     * 商品加入购物车
     *
     * @param productId
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Tip addItem(@RequestParam String productId,
                       @RequestParam(required = false) Integer quantity,
                       HttpSession session) {
        try {
            if (quantity == null || quantity == 0) {
                quantity = 1;
            }
            Member member = (Member) session.getAttribute("MEMBER");
            cartItemService.edit(member.getId(), productId, quantity);
            return new Tip(true, 100, "成功");
        } catch (Exception e) {
            logger.error("", e);
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
    public Tip raise(@RequestParam String productId, HttpSession session) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            int quantity = cartItemService.raise(member.getId(), productId);
            return new Tip(true, 100, quantity + "", quantity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("", e);
            return ExceptionTipHandler.handler(e);
        }
    }

    @RequestMapping(value = "reduce", method = RequestMethod.POST)
    @ResponseBody
    public Tip reduce(@RequestParam String productId, HttpSession session) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            int quantity = cartItemService.reduce(member.getId(), productId);
            return new Tip(true, 100, quantity + "", quantity);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("", e);
            return ExceptionTipHandler.handler(e);
        }
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
            logger.error("", e);
            return ExceptionTipHandler.handler(e);
        }
    }
}
