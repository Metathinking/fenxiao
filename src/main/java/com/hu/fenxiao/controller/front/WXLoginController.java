package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.WeiXinToken;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.WXLoginUtil;
import com.hu.fenxiao.wxpay.ConstantURL;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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

    private Logger logger = LogManager.getLogger(WXLoginController.class);

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "testLogin", method = RequestMethod.GET)
    public String testLogin(HttpSession session) {
        Member member = memberService.findByOpenId("oTstt1o_so8nHLTJdAMltiDo91vM");
//        Member member = memberService.findByOpenId("10002");
        logger.error("testLogin:" + member);
        session.setAttribute("MEMBER", member);
        return "redirect:/index";
    }


    /**
     * 进入微信登录授权页面
     *
     * @param memberId 推广人id
     * @param session
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String gotoLogin(@RequestParam(value = "id", required = false) Integer memberId, HttpSession session) {
        if (memberId != null && memberId != 0) {
            session.setAttribute("memberId", memberId);
        }
        String wxLoginUrl = "";
        try {
            //加密重定向连接
            String redirectURI = URLEncoder.encode(ConstantURL.REDIRECT_URI, "utf-8");
            wxLoginUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID
                    + "&redirect_uri=" + redirectURI +
                    "&response_type=code&scope=" + SCOPE + "&state=" + STATE
                    + "#wechat_redirect";
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
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
        logger.debug("-----------------微信登录---------------------");
        String getTokenUrl = String.format(weixinGetAccessToken, code);
        try {
            WeiXinToken token = WXLoginUtil.getObject(getTokenUrl, WeiXinToken.class);
            model.addAttribute("token", token.getAccess_token());
            String access_token = token.getAccess_token();
            Member member = WXLoginUtil.getObject(String.format(weixinGetUserInfo, access_token, token.getOpenid()), Member.class);
            //获取成员信息失败时，重新申请登录 todo huyubo
            if (StringUtils.isEmpty(member.getOpenid())) {
                return "redirect:/login";
            }

            Integer tuiGuangMemberId = (Integer) session.getAttribute("memberId");
//            logger.error("memberEdit:" + member.toString());
            Member db = memberService.edit(member, tuiGuangMemberId);
            session.setAttribute("MEMBER", db);

            return "redirect:/index";
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            model.addAttribute("error_msg", "授权登录失败");
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        } catch (IOException e) {
            model.addAttribute("error_msg", "授权登录失败");
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error_msg", e.getMessage());
            logger.error(e.getMessage(), e);
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
    private String APP_SECRET = "44e368e1847de6a9b616fe1ffb92b8e4";//real

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
