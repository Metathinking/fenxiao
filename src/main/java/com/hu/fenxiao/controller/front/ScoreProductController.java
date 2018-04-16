package com.hu.fenxiao.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScoreProductController {

    @RequestMapping(value = "member/score/product", method = RequestMethod.GET)
    public String scoreProduct() {
        return "";
    }
}
