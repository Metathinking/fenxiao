package com.hu.fenxiao.controller.admin;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("admin")
public class AdminHomeController {

    @RequestMapping(value = {"/", "index", "home"}, method = RequestMethod.GET)
    public String index(HttpServletRequest request) {
        return "redirect:/admin/order/list";
    }
}
