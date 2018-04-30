package com.hu.fenxiao.controller.front;

import com.google.zxing.WriterException;
import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.util.CodeImageUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("member/tui_guang")
public class TuiGuangController {

    private Logger logger = LogManager.getLogger(this.getClass());

    private final String URL = "http://jiu.leide365.com/login?id=";

    @RequestMapping(value = "er_wei_ma", method = RequestMethod.GET)
    public String erWeiMa(HttpSession session, HttpServletRequest request, Model model) {
        Member member = (Member) session.getAttribute("MEMBER");
        try {
            String codeImageUrl = CodeImageUtil.createQRCodeImage(member.getId(), URL + member.getId(), request);
            model.addAttribute("member", member);
            model.addAttribute("codeImageUrl", codeImageUrl);
        } catch (WriterException e) {
            e.printStackTrace();
            logger.error("", e);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("", e);
        }
        return "front/er_wei_ma";
    }

    @RequestMapping
    public String tuiguang() {
        return "front/tui_guang";
    }
}
