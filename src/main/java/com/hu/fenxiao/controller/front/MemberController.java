package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.domain.TiXianRecord;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberAccountService;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.TiXianRecordService;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("member")
public class MemberController {

    private Logger logger = LogManager.getLogger(MemberController.class);

    @Autowired
    private TiXianRecordService tiXianRecordService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberAccountService memberAccountService;

    @RequestMapping(value = "info", method = RequestMethod.GET)
    public String member(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute("MEMBER");
        MemberAccount account = memberAccountService.findById(member.getId());
        model.addAttribute("member", member);
        model.addAttribute("account", account);
        return "front/member";
    }
    

    @RequestMapping(value = "ti_xian_request", method = RequestMethod.POST)
    public String tiXianRequest(@RequestBody double money, HttpSession session, Model model) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            tiXianRecordService.create(member.getId(), money);

        } catch (ServiceException e) {
            model.addAttribute("error_msg", e.getExceptionMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/member/ti_xian_list";
    }

    @RequestMapping(value = "ti_xian_list", method = RequestMethod.GET)
    public String tiXianList(@RequestParam(required = false) Integer index,
                             Model model, HttpSession session) {
        try {
            if (index == null) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Member member = (Member) session.getAttribute("MEMBER");
            Map<String, Object> params = new HashMap<>();
            params.put("memberId", member.getId());
            List<TiXianRecord> list = tiXianRecordService.list(params);
            int count = tiXianRecordService.getCount(params);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();

        }
        return "front/ti_xian_list";
    }
}
