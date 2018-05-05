package com.hu.fenxiao.controller.front;

import com.google.zxing.WriterException;
import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.vo.MemberVO;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.util.CodeImageUtil;
import com.hu.fenxiao.wxpay.ConstantURL;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("member/tui_guang")
public class TuiGuangController {

    private Logger logger = LogManager.getLogger(this.getClass());


    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "er_wei_ma", method = RequestMethod.GET)
    public String erWeiMa(HttpSession session, HttpServletRequest request, Model model) {
        Member member = (Member) session.getAttribute("MEMBER");
        try {
            String codeImageUrl = CodeImageUtil.createQRCodeImage(member.getId(), ConstantURL.ER_WEI_MA + member.getId(), request);
            model.addAttribute("member", member);
            model.addAttribute("codeImageUrl", codeImageUrl);
        } catch (WriterException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "front/er_wei_ma";
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String tuiguang(@RequestParam(required = false) Integer index,
                           HttpSession session,
                           Model model) {
        try {
            if (index == null || index == 0) {
                index = 1;
            }
            Member member = (Member) session.getAttribute("MEMBER");
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            map.put("higherLevelOpenId", member.getOpenid());
            MemberVO memberVO = memberService.getTuiGuangList(map, member.getOpenid());
            int count = memberService.getCount(map);
            query.setCount(count);
            model.addAttribute("memberVO", memberVO);
            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "front/tui_guang_list";
    }
}
