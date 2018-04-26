package com.hu.fenxiao.controller.admin;


import com.hu.fenxiao.domain.SendRecord;
import com.hu.fenxiao.domain.vo.OrderVO;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.OrderService;
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
public class AdminOrderController {

    private Logger logger = LogManager.getLogger(AdminOrderController.class);

    @Autowired
    private OrderService orderService;

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
            List<OrderVO> list = orderService.list(map);
            int count = orderService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
            model.addAttribute("status", status);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
        return "admin/order_list";
    }

    @RequestMapping(value = "send", method = RequestMethod.POST)
    @ResponseBody
    public Tip send(@RequestBody Map<String, String> sendInfo) {
        try {
            orderService.sendProduct(sendInfo);
            return new Tip(true, 100, "", null);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return ExceptionTipHandler.handler(e);
        }
    }

    @RequestMapping(value = "sendInfo", method = RequestMethod.POST)
    @ResponseBody
    public Tip sendInfo(@RequestParam String orderId, @RequestParam String type) {
        try {
            SendRecord sendRecord = sendRecordService.findByOrderId(orderId, type);
            return new Tip(true, 100, "成功", sendRecord);
        } catch (Exception e) {
            logger.error(e.getMessage());
            return ExceptionTipHandler.handler(e);
        }
    }
}
