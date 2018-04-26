package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.SendRecord;
import com.hu.fenxiao.service.SendRecordService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("admin/send_record")
public class AdminSendRecordController {

    private Logger logger = LogManager.getLogger(AdminSendRecordController.class);

    @Autowired
    private SendRecordService sendRecordService;

    @RequestMapping(value = "send", method = RequestMethod.POST)
    @ResponseBody
    public Tip send(@RequestBody Map<String, String> sendInfo) {
        try {
            sendRecordService.sendProduct(sendInfo);
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
