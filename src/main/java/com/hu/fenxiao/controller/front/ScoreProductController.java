package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.ScoreProduct;
import com.hu.fenxiao.service.ScoreProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ScoreProductController {

    @Autowired
    private ScoreProductService scoreProductService;

    @RequestMapping(value = "score_product/{productId}",method = RequestMethod.GET)
    public String detail(@PathVariable String productId, Model model){
        ScoreProduct product = scoreProductService.findById(productId);
        model.addAttribute("product",product);
        return "front/score_product_detail";
    }

    @RequestMapping(value = "score_product_list", method = RequestMethod.GET)
    public String list(Model model, HttpSession session) {
        Object obj = session.getAttribute("MEMBER");
        if(obj!=null){
            model.addAttribute("member",obj);
        }
        List<ScoreProduct> productList = scoreProductService.list();
        model.addAttribute("productList", productList);
        return "front/score_product_list";
    }
}
