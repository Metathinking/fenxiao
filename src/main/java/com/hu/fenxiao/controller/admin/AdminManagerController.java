package com.hu.fenxiao.controller.admin;


import com.hu.fenxiao.domain.Manager;
import com.hu.fenxiao.service.ManagerService;
import com.hu.fenxiao.util.Md5Factory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminManagerController {

    private Logger logger = LogManager.getLogger(AdminManagerController.class);

    @Autowired
    private ManagerService managerService;

    @RequestMapping(value = "change_password", method = RequestMethod.GET)
    public String totoChangePassword() {
        return "admin/change_password";
    }

    @RequestMapping(value = "change_password", method = RequestMethod.POST)
    public String changePassword(String old_password, String new_password1,
                                 String new_password2, Model model, HttpSession session) {
        Manager manager = (Manager) session.getAttribute("manager");
        String errorMessage = null;
        Manager old = managerService.login(manager.getName(), Md5Factory.encoding(old_password));
        if (old == null) {
            errorMessage = "密码错误";
        } else if (StringUtils.isEmpty(old_password) || StringUtils.isEmpty(new_password1) ||
                StringUtils.isEmpty(new_password2)) {
            errorMessage = "密码不能为空";
        } else if (!new_password1.equals(new_password2)) {
            errorMessage = "两次密码不一致";
        } else if (old_password.equals(new_password1)) {
            errorMessage = "新密码不能与旧密码一致";
        }

        if (!StringUtils.isEmpty(errorMessage)) {
            model.addAttribute("errorMessage", errorMessage);
            return "admin/change_password";
        } else {

            managerService.changePassword(manager.getName(), Md5Factory.encoding(new_password1));
            return "redirect:/admin/logout";
        }

    }
}
