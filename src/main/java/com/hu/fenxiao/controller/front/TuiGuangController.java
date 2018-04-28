package com.hu.fenxiao.controller.front;

import com.google.zxing.WriterException;
import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.util.CodeImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("member/tui_guang")
public class TuiGuangController {


    @RequestMapping(value = "er_wei_ma",method = RequestMethod.GET)
    public String erWeiMa(HttpSession session, HttpServletRequest request){
        Member member = (Member) session.getAttribute("MEMBER");
        try {
            String codeImage = CodeImageUtil.createQRCodeImage(member.getId(), "http://www.baidu.com", request);
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "front/er_wei_ma";
    }

    public String tuiguang(){
        return "front/tui_guang";
    }
}
