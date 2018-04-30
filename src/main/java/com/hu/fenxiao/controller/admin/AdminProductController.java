package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {

    private Logger logger = LogManager.getLogger(AdminProductController.class);

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(@RequestParam(required = false) Integer index,Model model) {
        try {
            if (index == null) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            List<Product> list = productService.list(map);
            int count = productService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/product_list";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String gotoEdit(Model model, @RequestParam(value = "id", required = false) String id) {
        try {
            if (StringUtils.isEmpty(id)) {
                model.addAttribute("product", new Product());
            } else {
                Product product = productService.findById(id);
                if (product == null) {
                    product = new Product();
                }
                model.addAttribute("product", product);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/product_edit";
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
            logger.error("",ex);
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
        return "front/product_detail";
    }

}
