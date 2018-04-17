package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.OrderItem;
import com.hu.fenxiao.domain.vo.OrderVO;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.OrderService;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.type.OrderStatus;
import com.hu.fenxiao.util.Tip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("member/order")
public class OrderController {


    @Autowired
    private MemberService memberService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "be_sure", method = RequestMethod.GET)
    public String beSure(@RequestParam List<String> ids, HttpSession session) {
//    public String beSure( HttpSession session) {
        session.setAttribute("ids", ids);
        return "front/order_affirm";
    }

    @RequestMapping(value = "be_sure", method = RequestMethod.POST)
    @ResponseBody
    public Tip beSureGetInfo(HttpSession session) {
        List<String> ids = (List<String>) session.getAttribute("ids");
        OrderVO orderVO = orderService.affirm("", ids);
        return new Tip(true, 100, "成功", orderVO);
    }

    @RequestMapping(value = "order_submit", method = RequestMethod.POST)
    public Tip order_submit(@RequestBody OrderVO orderVO) {
        orderService.create(orderVO);
        return new Tip(true, 100, "成功");
    }


    @RequestMapping(value = "order_over", method = RequestMethod.GET)
    public String order_over() {
        return "front/order_over";
    }

    @RequestMapping(value = "order_list", method = RequestMethod.GET)
    public String order_list() {
        return "front/order_list";
    }
}
