package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.domain.WeiXinToken;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.util.WXLoginUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.util.List;

@Controller

public class HomeController {

    @Autowired
    private ProductService productService;

    /**
     * 进入首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = {"", "home", "index"}, method = RequestMethod.GET)
    public String home(Model model) {
        List<Product> productList = productService.list();
        model.addAttribute("productList", productList);
        return "front/index";
    }



}
