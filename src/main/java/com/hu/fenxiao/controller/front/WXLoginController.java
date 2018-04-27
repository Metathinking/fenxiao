package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.WeiXinToken;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.util.WXLoginUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;

@Controller
public class WXLoginController {

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "testLogin", method = RequestMethod.GET)
    public String testLogin(HttpSession session) {
        Member member = memberService.findByOpenId("10002");
        session.setAttribute("MEMBER", member);
        return "redirect:/index";
    }

    /**
     * 进入微信登录授权页面
     *
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String gotoLogin() {
        String wxLoginUrl = "";
        try {
            //加密重定向连接
            String redirectURI = URLEncoder.encode(REDIRECT_URI, "utf-8");
            wxLoginUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID
                    + "&redirect_uri=" + redirectURI +
                    "&response_type=code&scope=" + SCOPE + "&state=" + STATE
                    + "#wechat_redirect";
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:" + wxLoginUrl;
    }


    /**
     * 微信登录回调页面
     *
     * @return
     */
    @RequestMapping(value = "wx_login", method = RequestMethod.GET)
    public String wxLogin(@RequestParam(value = "code") String code,
                          @RequestParam(value = "state") String state,
                          Model model,
                          HttpSession session) {
        String getTokenUrl = String.format(weixinGetAccessToken, code);
        try {
            WeiXinToken token = WXLoginUtil.getObject(getTokenUrl, WeiXinToken.class);
            String access_token = token.getAccess_token();
            Member member = WXLoginUtil.getObject(String.format(weixinGetUserInfo, access_token, token.getOpenid()), Member.class);
//            saveImage(user.getHeadimgurl(), request);
            System.out.println(member);
            Member db = memberService.edit(member);
            session.setAttribute("MEMBER", member);

            return "redirect:/uc/" + db.getOpenid();
        } catch (MalformedURLException e) {
            model.addAttribute("授权登录失败");
            e.printStackTrace();
        } catch (IOException e) {
            model.addAttribute("授权登录失败");
            e.printStackTrace();
        }
        return "error";
    }

    /**
     * 微信登录示例
     * <p>
     * https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID
     * &redirect_uri=REDIRECT_URI
     * &response_type=code
     * &scope=SCOPE
     * &state=STATE#wechat_redirect
     */

    private String APP_ID = "wx0b80f1b0a4c1602f";//real
    //    private String APP_ID = "wx081395b7cdc2a00e";
//    private String APP_SECRET = "4074d7a66e92d0b93b1152d07766ad7e";
    private String APP_SECRET = "44e368e1847de6a9b616fe1ffb92b8e4";//real
    private String REDIRECT_URI = "localhost/wx_login";
    private String SCOPE = "snsapi_userinfo"; //snsapi_base || snsapi_userinfo
    private String STATE = "STATEE";

    /**
     * 微信授权登录
     */
//    private String wxLoginUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID
//            + "&redirect_uri=" + REDIRECT_URI +
//            "&response_type=code&scope=" + SCOPE + "&state="+STATE
//            +"#wechat_redirect";

    /**
     * 获取token
     */
    private String weixinGetAccessToken = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + APP_ID
            + "&secret=" + APP_SECRET + "&code=%s&grant_type=authorization_code";

    private String weixinGetUserInfo = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN";
}
