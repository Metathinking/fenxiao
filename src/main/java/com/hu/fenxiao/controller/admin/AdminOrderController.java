package com.hu.fenxiao.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {


    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String gotoList(){

        return "admin/orderList";
    }
}
