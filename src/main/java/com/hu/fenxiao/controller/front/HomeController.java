package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller

public class HomeController {

    @Autowired
    private ProductService productService;



    @RequestMapping(value = {"","home","index"},method = RequestMethod.GET)
    public String home(Model model){
        List<Product> productList = productService.list();
        model.addAttribute("productList",productList);
        return "front/index";
    }
}
