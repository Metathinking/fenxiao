package com.hu.fenxiao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

    @RequestMapping(value = "error_404",method = RequestMethod.GET)
    public String error_404(){
        return "error_404";
    }

    @RequestMapping(value = "error_500",method = RequestMethod.GET)
    public String error_500(){

        return "error_500";
    }
}
