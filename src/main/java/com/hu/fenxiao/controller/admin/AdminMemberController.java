package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/member")
public class AdminMemberController {

    private Logger logger = LogManager.getLogger(AdminMemberController.class);

    @Autowired
    private MemberService memberService;


    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String gotoList(@RequestParam(required = false) Integer index,
                           @RequestParam(required = false) String search,
                           Model model) {
        try {
            if (index == null) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            if (search != null) {
                map.put("search", search);
            }
            List<Member> list = memberService.list(map);
            int count = memberService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
            model.addAttribute("search",search);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/member_list";
    }
}
