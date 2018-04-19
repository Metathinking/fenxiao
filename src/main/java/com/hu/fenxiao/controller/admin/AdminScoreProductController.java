package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.ScoreProduct;
import com.hu.fenxiao.service.ScoreProductService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("admin/score_product")
public class AdminScoreProductController {

    @Autowired
    private ScoreProductService scoreProductService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<ScoreProduct> list = scoreProductService.list();
        model.addAttribute("list", list);
        return "admin/score_product_list";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String gotoEdit(Model model, @RequestParam(value = "id", required = false) String id) {
        if (StringUtils.isEmpty(id)) {
            model.addAttribute("product", new ScoreProduct());
        } else {
            ScoreProduct product = scoreProductService.findById(id);
            if (product == null) {
                product = new ScoreProduct();
            }
            model.addAttribute("product", product);
        }
        return "admin/score_product_edit";
    }

    /**
     * @param product
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Tip edit(@RequestBody ScoreProduct product) {
//todo 检查字段
        try {
            if (product.getId() == 0) {
                scoreProductService.create(product);
            } else {
                ScoreProduct old = scoreProductService.findById(String.valueOf(product.getId()));
                if (old == null) {
                    scoreProductService.create(product);
                } else {
                    scoreProductService.update(product);
                }
            }
            return new Tip(true, 100, "保存成功", null);
        } catch (Exception ex) {
            return ExceptionTipHandler.handler(ex);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam String id) {
        scoreProductService.delete(id);
        return "redirect:/admin/score_product/list";
    }

    @RequestMapping(value = "findById", method = RequestMethod.GET)
    public String findById(@RequestParam String id, Model model) {
        ScoreProduct product = scoreProductService.findById(id);
        model.addAttribute("product", product);
        return "product";
    }
}
