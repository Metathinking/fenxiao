package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.Manufacturer;
import com.hu.fenxiao.service.ManufacturerService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("admin/manufacturer")
public class AdminManufacturerController {
    private Logger logger = LogManager.getLogger(AdminManufacturerController.class);
    @Autowired
    private ManufacturerService manufacturerService;

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String gotoEdit(Model model) {
        try {
            Manufacturer manufacturer = manufacturerService.find();
            if (manufacturer==null){
                manufacturer = new Manufacturer();
            }
            model.addAttribute("manufacturer",manufacturer);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/manufacturer";
    }

    @RequestMapping(value = "edit",method = RequestMethod.POST)
    @ResponseBody
    public Tip edit(@RequestBody Manufacturer manufacturer){
        try {
            manufacturerService.edit(manufacturer);
            return new Tip(true,100,"信息更新成功");
        } catch (Exception e) {
            logger.error("",e);
            return ExceptionTipHandler.handler(e);
        }
    }
}
