package com.hu.fenxiao.controller.admin;


import com.hu.fenxiao.domain.TuiGuangSetting;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.service.TuiGuangSettingService;
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
@RequestMapping("admin/tui_guang_setting")
public class AdminTuiGuangSettingController {

    private Logger logger = LogManager.getLogger(AdminTuiGuangSettingController.class);

    @Autowired
    private TuiGuangSettingService tuiGuangSettingService;

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String gotoEdit(Model model) {
        try {
            TuiGuangSetting tuiGuangSetting = tuiGuangSettingService.find();
            if (tuiGuangSetting == null) {
                tuiGuangSetting = new TuiGuangSetting();
            }
            model.addAttribute("tuiGuangSetting", tuiGuangSetting);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "admin/tui_guang_setting";
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public Tip edit(@RequestBody TuiGuangSetting tuiGuangSetting) {
        try {
            tuiGuangSettingService.edit(tuiGuangSetting);
            return new Tip(true, 100, "信息更新成功");
        } catch (ServiceException e) {
            e.printStackTrace();
            return ExceptionTipHandler.handler(e);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return ExceptionTipHandler.handler(e);
        }
    }
}
