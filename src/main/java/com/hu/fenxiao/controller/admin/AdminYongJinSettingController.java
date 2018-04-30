package com.hu.fenxiao.controller.admin;


import com.hu.fenxiao.domain.YongJinSetting;
import com.hu.fenxiao.service.YongJinSettingService;
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
@RequestMapping("admin/yong_jin_setting")
public class AdminYongJinSettingController {

    private Logger logger = LogManager.getLogger(AdminYongJinSettingController.class);

    @Autowired
    private YongJinSettingService yongJinSettingService;

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String gotoEdit(Model model) {
        try {
            YongJinSetting yongJinSetting = yongJinSettingService.find();
            if (yongJinSetting==null){
                yongJinSetting = new YongJinSetting();
            }
            model.addAttribute("yongJinSetting",yongJinSetting);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/yong_jin_setting";
    }

    @RequestMapping(value = "edit",method = RequestMethod.POST)
    @ResponseBody
    public Tip edit(@RequestBody YongJinSetting yongJinSetting){
        try {
            yongJinSettingService.edit(yongJinSetting);
            return new Tip(true,100,"信息更新成功");
        } catch (Exception e) {
            logger.error("",e);
            return ExceptionTipHandler.handler(e);
        }
    }
}
