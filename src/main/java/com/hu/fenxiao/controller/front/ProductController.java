package com.hu.fenxiao.controller.front;


import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    private Logger logger = LogManager.getLogger(this.getClass());

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "product/{productId}",method = RequestMethod.GET)
    public String detail(@PathVariable String productId, Model model){
        try {
            Product product = productService.findById(productId);
            model.addAttribute("product",product);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
        }
        return "front/product_detail";
    }
}
