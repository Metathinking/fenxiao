package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.HomeImage;
import com.hu.fenxiao.service.HomeImageService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("admin/homeImage")
public class AdminHomeImageController {

    private Logger logger = LogManager.getLogger(AdminHomeImageController.class);

    @Autowired
    private HomeImageService homeImageService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String gotoEdit(Model model) {
        try {
            List<HomeImage> list = homeImageService.list();
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/home_image";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Tip add(@RequestBody HomeImage homeImage) {
        try {
            homeImageService.create(homeImage);
            return new Tip(true, 100, "保存成功");
        } catch (Exception e) {
            logger.error("",e);
            return ExceptionTipHandler.handler(e);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam String id) {
        try {
            homeImageService.delete(id);
        } catch (Exception e) {
            logger.error("",e);
        }
        return "redirect:/admin/homeImage/list";
    }
}
