package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.domain.ScoreRecord;
import com.hu.fenxiao.domain.TiXianRecord;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberAccountService;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.ScoreRecordService;
import com.hu.fenxiao.service.TiXianRecordService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    private ScoreRecordService scoreRecordService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberAccountService memberAccountService;

    @RequestMapping(value = "info", method = RequestMethod.GET)
    public String member(HttpSession session, Model model) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            MemberAccount account = memberAccountService.findById(member.getId());
            model.addAttribute("member", member);
            model.addAttribute("account", account);
            model.addAttribute("sign", "member");
            boolean hasTuiGuangPower = memberAccountService.hasTuiGuangPower(member.getId());
            model.addAttribute("hasTuiGuangPower", hasTuiGuangPower);
//            model.addAttribute("hasTuiGuangPower", true);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "front/member";
    }


    @RequestMapping(value = "ti_xian_request", method = RequestMethod.POST)
    public String tiXianRequest(Double money,
                                String phone,
                                String memberWords,
                                HttpSession session,
                                RedirectAttributes model) {
        try {
            boolean correct = isCorrect(money);
            if (!correct) {
                model.addAttribute("error_msg", "请输入正确的金额");
                return "redirect:/member/ti_xian_list";
            }
            if (StringUtils.isEmpty(phone)) {
                model.addAttribute("error_msg", "请输入联系电话");
                return "redirect:/member/ti_xian_list";
            }
            if (StringUtils.isEmpty(memberWords)) {
                model.addAttribute("error_msg", "请输入提现信息，否则无法提现");
                return "redirect:/member/ti_xian_list";
            }
            Member member = (Member) session.getAttribute("MEMBER");
            tiXianRecordService.create(member.getId(), money, memberWords, phone);
        } catch (ServiceException e) {
            model.addAttribute("error_msg", e.getExceptionMessage());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "redirect:/member/ti_xian_list";
    }

    /**
     * 提现金额不能 为空，且最多有两位小数
     *
     * @param money
     * @return
     */
    private boolean isCorrect(Double money) {
        if (money == null || money <= 0) {
            return false;
        }
        String moneyStr = money.toString();
        boolean contains = moneyStr.contains(".");
        if (contains) {
            String substring = moneyStr.substring(moneyStr.indexOf(".") + 1);
            if (substring.length() > 2) {
                return false;
            }
        }
        return true;
    }

    /**
     * @param index
     * @param error_msg 请求重定向参数
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "ti_xian_list", method = RequestMethod.GET)
    public String tiXianList(@RequestParam(required = false) Integer index,
                             @ModelAttribute("error_msg") String error_msg,
                             Model model, HttpSession session) {
        try {
            if (index == null || index == 0) {
                index = 1;
            }
            if (!StringUtils.isEmpty(error_msg)) {
                model.addAttribute("error_msg", error_msg);
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Member member = (Member) session.getAttribute("MEMBER");
            Map<String, Object> params = new HashMap<>();
            params.put("memberId", member.getId());
            params.put("start", query.getStart());
            params.put("size", query.getSize());
            List<TiXianRecord> list = tiXianRecordService.list(params);
            int count = tiXianRecordService.getCount(params);
            query.setCount(count);
            MemberAccount account = memberAccountService.findById(member.getId());
            model.addAttribute("account", account);
            Member db = memberService.findByOpenId(member.getOpenid());
            model.addAttribute("member", db);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "front/ti_xian_list";
    }

    /**
     * 取消申请
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "ti_xian_cancel", method = RequestMethod.GET)
    public String tiXianCancel(String id, RedirectAttributes model) {
        try {
            tiXianRecordService.cancel(id);
        } catch (ServiceException e) {
            model.addAttribute("error_msg", e.getExceptionMessage());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "redirect:/member/ti_xian_list";
    }

    /**
     * @param index
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "score_list", method = RequestMethod.GET)
    public String scoreList(@RequestParam(required = false) Integer index,
                            Model model, HttpSession session) {
        try {
            if (index == null || index == 0) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Member member = (Member) session.getAttribute("MEMBER");
            Map<String, Object> params = new HashMap<>();
            params.put("memberId", member.getId());
            params.put("start", query.getStart());
            params.put("size", query.getSize());
            List<ScoreRecord> list = scoreRecordService.list(params);
            int count = scoreRecordService.getCount(params);
            query.setCount(count);

            MemberAccount account = memberAccountService.findById(member.getId());
            model.addAttribute("account", account);

            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "front/score_list";
    }
}
