package com.hu.fenxiao.controller.admin;


import com.hu.fenxiao.domain.Manager;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.service.ManagerService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Md5Factory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    private Logger logger = LogManager.getLogger(AdminTuiGuangSettingController.class);

    @Autowired
    private ManagerService managerService;

    @RequestMapping(value = "adminLogin", method = RequestMethod.GET)
    public String gotoLogin() {
        return "admin/login";
    }

    @RequestMapping(value = "adminLogin", method = RequestMethod.POST)
    public String login(String username, String password, HttpSession session, Model model) {
        try {
            Manager manager = managerService.login(username, Md5Factory.encoding(password));
            if (manager == null) {
                model.addAttribute("errorMessage", "用户名或密码错误");
                return "admin/login";
            }
            manager.setPassword(null);
            session.setAttribute("manager", manager);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "redirect:/admin/home";
    }

    @RequestMapping(value = "admin/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.setAttribute("manager", null);
        return "redirect:/adminLogin";
    }

    @RequestMapping(value = "reset", method = RequestMethod.GET)
    public String gotoReset() {
        return "admin/reset";
    }

    @RequestMapping(value = "reset", method = RequestMethod.POST)
    public String reset(String username, String password, Model model) {
        try {
            managerService.reset(username, password);
        } catch (ServiceException e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            model.addAttribute("errorMessage", e.getMessage());
            logger.error(e.getMessage(), e);
            return "admin/reset";
        }
        return "redirect:/adminLogin";
    }
}
