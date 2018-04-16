package com.hu.fenxiao.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

    @RequestMapping(value = "member",method = RequestMethod.GET)
    public String member(Model model){

        return "front/member";
    }
}
