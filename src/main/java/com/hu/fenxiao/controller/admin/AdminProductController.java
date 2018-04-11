package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.FileUtil;
import com.hu.fenxiao.util.Tip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<Product> list = productService.list();
        model.addAttribute("list", list);
        return "admin/productList";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String gotoEdit(Model model, @RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isEmpty(id)) {
            model.addAttribute("product", new Product());
        } else {
            Product product = productService.findById(id);
            if (product == null) {
                product = new Product();
            }
            model.addAttribute("product", product);
        }
        return "admin/editProduct";
    }

    /**
     * @param product
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Tip edit(@RequestBody Product product) {
//todo 检查字段
        try {
            if (product.getId() == 0) {
                productService.create(product);
            } else {
                Product old = productService.findById(String.valueOf(product.getId()));
                if (old == null) {
                    productService.create(product);
                } else {
                    productService.update(product);
                }
            }
            return new Tip(true, 100, "保存成功", null);
        } catch (Exception ex) {
            return ExceptionTipHandler.handler(ex);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam String id) {
        productService.delete(id);
        return "redirect:/admin/product/list";
    }

    @RequestMapping(value = "findById", method = RequestMethod.GET)
    public String findById(@RequestParam String id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "product";
    }

}
