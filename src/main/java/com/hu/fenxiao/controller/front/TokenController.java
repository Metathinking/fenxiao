package com.hu.fenxiao.controller.front;


import com.hu.fenxiao.util.SHA1;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

/**
 * token 验证
 */
@Controller
public class TokenController {

    private String TOKEN = "wxpaytoken";

    @RequestMapping(value = "validate")
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
//        String signature = request.getParameter("signature");
//        String timestamp = request.getParameter("timestamp");
//        String nonce = request.getParameter("nonce");
//        String echostr = request.getParameter("echostr");
//        System.out.println("signature:" + signature);
//        System.out.println("timestamp:" + timestamp);
//        System.out.println("nonce:" + nonce);
//        System.out.println("echostr:" + echostr);
//        PrintWriter pw = null;
//        try {
//            pw = response.getWriter();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        pw.append(echostr);
//        pw.flush();
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 随机字符串
        String echostr = request.getParameter("echostr");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");

        String[] str = { TOKEN, timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest = SHA1.encode(bigStr).toLowerCase();

        // 确认请求来至微信
        if (digest.equals(signature)) {
            try {
                response.getWriter().print(echostr);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
