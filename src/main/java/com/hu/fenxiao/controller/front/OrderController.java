package com.hu.fenxiao.controller.front;

import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayConfig;
import com.github.wxpay.sdk.WXPayConstants;
import com.github.wxpay.sdk.WXPayUtil;
import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.OrderItem;
import com.hu.fenxiao.domain.vo.OrderVO;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.OrderService;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.type.OrderStatus;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import com.hu.fenxiao.wxpay.ConstantURL;
import com.hu.fenxiao.wxpay.WXPayConfigImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
        try {
            logger.debug("------------获取订单数据----------------");
            List<String> ids = (List<String>) session.getAttribute("ids");
            Member member = (Member) session.getAttribute("MEMBER");
            OrderVO orderVO = orderService.affirm(member.getOpenid(), ids);
            return new Tip(true, 100, "成功", orderVO);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("", e);
            return ExceptionTipHandler.handler(e);
        }
    }

    /**
     * 页面提交订单，保存订单信息，向微信后台提交同一订单，和获取pre_id
     *
     * @param orderVO
     * @param request
     * @return
     */
    @RequestMapping(value = "order_submit", method = RequestMethod.POST)
    @ResponseBody
    public Tip order_submit(@RequestBody OrderVO orderVO, HttpServletRequest request, HttpSession session) {
        logger.debug("---------------提交订单-------------------------");
        try {
            Member member = (Member) request.getSession().getAttribute("MEMBER");
            orderVO.getOrder().setMemberOpenid(member.getOpenid());
            if (StringUtils.isEmpty(orderVO.getOrder().getPhone())) {
                return new Tip(false, 103, "请填写电话号码");
            }
            if (StringUtils.isEmpty(orderVO.getOrder().getAddress())) {
                return new Tip(false, 104, "请填写地址信息");
            }
            OrderVO db = orderService.create(orderVO);
            Map<String, String> wxMap = getPayAndBackMap(request, db);
            session.setAttribute("PAY", wxMap);
            return new Tip(true, 100, "成功", wxMap);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return new Tip(false, 102, e.getMessage());
        }
    }

    private Map<String, String> getPayAndBackMap(HttpServletRequest request,
                                                 OrderVO db) throws Exception {
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
        data.put("total_fee", ((int) (db.getOrder().getGrandTotal() * 100)) + "");//金额
        logger.error("total_fee=" + ((int) (db.getOrder().getGrandTotal() * 100)));
        data.put("spbill_create_ip", request.getRemoteAddr());//终端IP
        data.put("notify_url", ConstantURL.NOTIFY_URL);//通知地址
        data.put("product_id", db.getOrder().getId() + "");
        data.put("openid", db.getOrder().getMemberOpenid());
        Map<String, String> wxMap = this.unifiedOrder(data);
        wxMap.put("totalFee", db.getOrder().getGrandTotal() + "");
        return wxMap;
    }

    @RequestMapping(value = "re_pay", method = RequestMethod.GET)
    public String paySure(@RequestParam String orderId,
                          HttpServletRequest request,
                          Model model) {
        try {
            Member member = (Member) request.getSession().getAttribute("MEMBER");
            OrderVO db = orderService.rePay(orderId, member.getOpenid());
            Map<String, String> wxMap = getPayAndBackMap(request, db);
            model.addAttribute("wxMap", wxMap);
        } catch (ServiceException e) {
            model.addAttribute("error_msg", e.getExceptionMessage());
            return "error";
        } catch (Exception e) {
            model.addAttribute("error_msg", e.getMessage());
            return "error";
        }
        return "front/wxpay";
    }


    @RequestMapping(value = "pay_success", method = RequestMethod.GET)
    public String order_over() {
        return "front/pay_success";
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
                           @RequestParam(required = false) String memberOpenid,
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
            if (!StringUtils.isEmpty(status)) {
                map.put("status", status);
            }
            if (StringUtils.isEmpty(memberOpenid)) {
                Member member = (Member) session.getAttribute("MEMBER");
                map.put("memberOpenid", member.getOpenid());
            } else {
                map.put("memberOpenid", memberOpenid);
                model.addAttribute("openid", memberOpenid);
            }
            List<OrderVO> list = orderService.list(map);
            int count = orderService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("", e);
        }
        return "front/order_list";
    }

    /**
     * 订单详情
     *
     * @param orderId
     * @param model
     * @return
     */
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(@RequestParam String orderId, HttpSession session, Model model) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            OrderVO orderVO = orderService.findById(orderId);
            if (orderVO.getOrder()==null){
                return "redirect:/member/order/list";
            }
            model.addAttribute("orderVO", orderVO);
            model.addAttribute("isCurrentMember", member.getOpenid().equals(orderVO.getOrder().getMemberOpenid()));
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "front/order_detail";
    }

    /**
     * 订单详情
     *
     * @param orderId
     * @param model
     * @return
     */
    @RequestMapping(value = "cancel", method = RequestMethod.GET)
    public String cancel(@RequestParam String orderId, HttpSession session, Model model) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
             orderService.cancel(orderId,member.getOpenid());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "redirect:/member/order/list";
    }


    /**
     * 确认收货
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "shouHuo", method = RequestMethod.GET)
    public String shouHuo(@RequestParam String orderId, HttpSession session) {
        try {
            Member member = (Member) session.getAttribute("MEMBER");
            orderService.shouHuo(orderId, member.getOpenid());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "redirect:/member/order/detail?orderId=" + orderId;
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
        logger.error("resultMap:" + resultMap.toString());

        // 支付JSAPI回传参数
        Map<String, String> wxMap = new HashMap<String, String>();
        wxMap.put("appId", config.getAppID());
        wxMap.put("timeStamp", System.currentTimeMillis() / 1000 + "");
        wxMap.put("nonceStr", WXPayUtil.generateNonceStr());
        wxMap.put("package", "prepay_id=" + resultMap.get("prepay_id"));
//        wxMap.put("signType", "HMAC-SHA256");
        wxMap.put("signType", "MD5");
        String sign = null;
        try {
//            sign = WXPayUtil.generateSignature(wxMap, config.getKey(), WXPayConstants.SignType.HMACSHA256);
            sign = WXPayUtil.generateSignature(wxMap, config.getKey(), WXPayConstants.SignType.MD5);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("--------------微信签名-----------------");
            logger.error("", e);
        }
        wxMap.put("paySign", sign);
        wxMap.put("pack", "prepay_id=" + resultMap.get("prepay_id"));
        logger.error(wxMap.toString());
        return wxMap;
    }


}
