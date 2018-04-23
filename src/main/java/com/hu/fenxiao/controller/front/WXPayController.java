package com.hu.fenxiao.controller.front;

import com.github.wxpay.sdk.WXPayUtil;
import com.hu.fenxiao.service.OrderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class WXPayController {

    private Logger logger = LogManager.getLogger(WXPayController.class);

    @Autowired
    private OrderService orderService;


    /**
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     * @Description: 微信支付通知
     * @return: String
     */
    @RequestMapping("/notify")
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void notify(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("-----------------------------进入notify控制层-----------------------------");
        DataInputStream in;
        DataOutputStream out;
        String wxNotifyXml = "";
        try {
            in = new DataInputStream(request.getInputStream());
            byte[] dataOrigin = new byte[request.getContentLength()];
            in.readFully(dataOrigin); // 根据长度，将消息实体的内容读入字节数组dataOrigin中

            in.close(); // 关闭数据流
            wxNotifyXml = new String(dataOrigin); // 从字节数组中得到表示实体的字符串
            Map<String, String> notifyMap = WXPayUtil.xmlToMap(wxNotifyXml);

            logger.info("mch_id:" + notifyMap.get("mch_id"));
            logger.info("result_code:" + notifyMap.get("result_code"));
            logger.info("sign:" + notifyMap.get("sign"));
            logger.info("total_fee:" + notifyMap.get("total_fee"));
            logger.info("transaction_id:" + notifyMap.get("transaction_id"));
            logger.info("out_trade_no:" + notifyMap.get("out_trade_no"));

            orderService.paySuccess(notifyMap.get("out_trade_no"));

            Map<String, String> resultMap = new HashMap<String, String>();
            resultMap.put("return_code", "SUCCESS");
            resultMap.put("return_msg", "");
            String resultXml = WXPayUtil.mapToXml(resultMap);
            out = new DataOutputStream(response.getOutputStream());
            byte[] resultByte = resultXml.getBytes();
            out.write(resultByte);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
    }


}
