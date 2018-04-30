package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.vo.ScoreOrderVO;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.ScoreOrderService;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("member/score_order")
public class ScoreOrderController {

    private Logger logger = LogManager.getLogger(ScoreOrderController.class);

    @Autowired
    private ScoreOrderService scoreOrderService;

    @RequestMapping(value = "change", method = RequestMethod.POST)
    @ResponseBody
    public Tip change(@RequestBody ScoreOrderVO scoreOrderVO, HttpSession session) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            scoreOrderService.create(scoreOrderVO, member);
            return new Tip(true, 100, "兑换成功");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
            return new Tip(false, 102, e.getMessage());
        }
    }

    /**
     * 订单列表
     *
     * @param index
     * @param status
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String gotoList(@RequestParam(required = false) Integer index,
                           @RequestParam(required = false) String status,
                           Model model,
                           HttpSession session) {
        try {
            model.addAttribute("status", status);
            if (index == null) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            if (status != null) {
                map.put("status", status);
            }
            Member member = (Member) session.getAttribute("MEMBER");
            map.put("memberOpenid", member.getOpenid());

            List<ScoreOrderVO> list = scoreOrderService.list(map);
            int count = scoreOrderService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "front/score_order_list";
    }

    /**
     * 订单详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(@RequestParam String id, Model model) {
        try {
            ScoreOrderVO orderVO = scoreOrderService.findById(id);
            model.addAttribute("orderVO", orderVO);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "front/score_order_detail";
    }


    @RequestMapping(value = "shouHuo", method = RequestMethod.GET)
    public String shouHuo(@RequestParam String id) {
        try {
            scoreOrderService.shouHuo(id);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "redirect:/member/score_order/detail";
    }
}
