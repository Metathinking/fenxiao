package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.ScoreProduct;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.ScoreProductService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ScoreProductController {

    private Logger logger = LogManager.getLogger(ScoreProductController.class);

    @Autowired
    private ScoreProductService scoreProductService;

    @RequestMapping(value = "score_product/{productId}",method = RequestMethod.GET)
    public String detail(@PathVariable String productId, Model model){
        try {
            ScoreProduct product = scoreProductService.findById(productId);
            model.addAttribute("product",product);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "front/score_product_detail";
    }

    @RequestMapping(value = "score_product_list", method = RequestMethod.GET)
    public String list(Model model, HttpSession session) {
        try {
            Object obj = session.getAttribute("MEMBER");
            if(obj!=null){
                model.addAttribute("member",obj);
            }
            PageQuery query = new PageQuery();
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            List<ScoreProduct> productList = scoreProductService.list(map);
            model.addAttribute("productList", productList);
            model.addAttribute("sign", "score");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "front/score_product_list";
    }
}
