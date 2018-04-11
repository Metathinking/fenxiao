package com.hu.fenxiao.controller.front;


import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "product/{productId}",method = RequestMethod.GET)
    public String detail(@PathVariable String productId, Model model){
        Product product = productService.findById(productId);
        model.addAttribute("product",product);
        return "front/product_detail";
    }
}
