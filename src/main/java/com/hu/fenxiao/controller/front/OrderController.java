package com.hu.fenxiao.controller.front;

import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConfig;
import com.github.wxpay.sdk.WXPayConstants;
import com.github.wxpay.sdk.WXPayUtil;
import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.OrderItem;
import com.hu.fenxiao.domain.vo.OrderVO;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.OrderService;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.type.OrderStatus;
import com.hu.fenxiao.util.Tip;
import com.hu.fenxiao.wxpay.WXPayConfigImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("member/order")
public class OrderController {

    private Logger logger = LogManager.getLogger(OrderController.class);


    @Autowired
    private MemberService memberService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "be_sure", method = RequestMethod.GET)
    public String beSure(@RequestParam List<String> ids, HttpSession session) {
//    public String beSure( HttpSession session) {
        session.setAttribute("ids", ids);
        logger.debug("-------------进入订单确认页面---------------");
        return "front/order_affirm";
    }

    @RequestMapping(value = "be_sure", method = RequestMethod.POST)
    @ResponseBody
    public Tip beSureGetInfo(HttpSession session) {
        logger.debug("------------获取订单数据----------------");
        List<String> ids = (List<String>) session.getAttribute("ids");
        OrderVO orderVO = orderService.affirm("", ids);//todo memberId
        return new Tip(true, 100, "成功", orderVO);
    }

    /**
     * 页面提交订单，保存订单信息，向微信后台提交同一订单，和获取pre_id
     *
     * @param orderVO
     * @param request
     * @return
     */
    @RequestMapping(value = "order_submit", method = RequestMethod.POST)
    public Tip order_submit(@RequestBody OrderVO orderVO, HttpServletRequest request) {
        logger.debug("---------------提交订单-------------------------");
        try {
            OrderVO db = orderService.create(orderVO);
            StringBuilder detail = new StringBuilder();
            List<OrderItem> itemList = db.getItemList();
            for (OrderItem item : itemList) {
                detail.append(item.getName()).append(";");
            }
            Map<String, String> data = new TreeMap<String, String>();
            //以下参数自己设定
            data.put("body", "购买商品:" + detail.toString());//商品名称
            data.put("detail", detail.toString());//商品详情
            data.put("out_trade_no", db.getOrder().getId() + "");
            data.put("total_fee", db.getOrder().getGrandTotal() * 100 + "");//金额
            data.put("spbill_create_ip", request.getRemoteAddr());//终端IP
            data.put("notify_url", "");//通知地址
            data.put("product_id", db.getOrder().getId() + "");
            Map<String, String> wxMap = this.unifiedOrder(data);
            wxMap.put("totalFee", db.getOrder().getGrandTotal() + "");
            return new Tip(true, 100, "成功", wxMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return new Tip(false, 102, e.getMessage());
        }
    }


    @RequestMapping(value = "pay_success", method = RequestMethod.GET)
    public String order_over() {
        return "front/pay_success";
    }

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
            map.put("memberOpenid",member.getOpenid());

            List<OrderVO> list = orderService.list(map);
            int count = orderService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);

        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
        return "front/order_list";
    }


    /**
     * 提交微信请求订单，获取pre_id
     *
     * @return
     * @throws Exception
     */
    private Map<String, String> unifiedOrder(Map<String, String> data) throws Exception {
        WXPayConfig config = WXPayConfigImpl.getInstance();
        WXPay wxPay = new WXPay(config);

        data.put("device_info", "WEB");
        data.put("sign_type", "MD5");
        data.put("fee_type", "CNY");
        data.put("trade_type", "JSAPI");//交易类型

        Map<String, String> resultMap = wxPay.unifiedOrder(data);//发起请求

        // 支付JSAPI回传参数
        Map<String, String> wxMap = new HashMap<String, String>();
        wxMap.put("appId", config.getAppID());
        wxMap.put("timeStamp", "" + new Date().getTime());
        wxMap.put("nonceStr", WXPayUtil.generateNonceStr());
        wxMap.put("package", "prepay_id=" + resultMap.get("prepay_id"));
        wxMap.put("signType", "HMAC-SHA256");
        String sign = null;
        try {
            sign = WXPayUtil.generateSignature(wxMap, config.getKey(), WXPayConstants.SignType.HMACSHA256);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("--------------微信签名-----------------");
            logger.error(e.getMessage());
        }
        wxMap.put("paySign", sign);
        wxMap.put("pack", "prepay_id=" + resultMap.get("prepay_id"));
        return wxMap;
    }

    private String notify_url = "";//WXPayController.notify()
}
