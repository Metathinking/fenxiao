package com.hu.fenxiao.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

    @RequestMapping(value = "order_submit", method = RequestMethod.GET)
    public String order_submit() {
        return "front/order_submit";
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
