package com.hu.fenxiao.controller.admin;


import com.hu.fenxiao.domain.SendRecord;
import com.hu.fenxiao.domain.vo.ScoreOrderVO;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.ScoreOrderService;
import com.hu.fenxiao.service.SendRecordService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/order")
public class AdminScoreOrderController {

    private Logger logger = LogManager.getLogger(AdminScoreOrderController.class);

    @Autowired
    private ScoreOrderService scoreOrderService;

    @Autowired
    private SendRecordService sendRecordService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String gotoList(@RequestParam(required = false) Integer index,
                           @RequestParam(required = false) String status,
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
            if (status != null) {
                map.put("status", status);
            }
            List<ScoreOrderVO> list = scoreOrderService.list(map);
            int count = scoreOrderService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
            model.addAttribute("status", status);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
        return "admin/score_order_list";
    }


}
