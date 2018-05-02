package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.service.MemberAccountService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("admin/member_account")
public class AdminMemberAccountController {

    private Logger logger = LogManager.getLogger(AdminMemberAccountController.class);

    @Autowired
    private MemberAccountService memberAccountService;

    @RequestMapping(value = "findById", method = RequestMethod.POST)
    @ResponseBody
    public Tip findById(Integer id) {
        try {
            MemberAccount account = memberAccountService.findById(id);
            return new Tip(true, 100, "成功", account);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
            return ExceptionTipHandler.handler(e);
        }
    }
}
