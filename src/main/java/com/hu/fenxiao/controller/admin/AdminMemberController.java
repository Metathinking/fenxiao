package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {

    @Autowired
    private MemberService memberService;


    @RequestMapping(value = "list",method = RequestMethod.POST)
    public String gotoList(){

        return "admin/member";
    }
}
