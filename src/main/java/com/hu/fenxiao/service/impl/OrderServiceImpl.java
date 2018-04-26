package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.*;
import com.hu.fenxiao.domain.vo.OrderVO;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.*;
import com.hu.fenxiao.service.OrderService;
import com.hu.fenxiao.type.MoneyChangeReason;
import com.hu.fenxiao.type.OrderStatus;
import com.hu.fenxiao.type.OrderType;
import com.hu.fenxiao.type.ScoreChangeReason;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    private Logger logger = LogManager.getLogger(OrderServiceImpl.class);

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private YongJinSettingRepository yongJinSettingRepository;

    @Autowired
    private MoneyRecordRepository moneyRecordRepository;

    @Autowired
    private MemberAccountRepository memberAccountRepository;

    @Autowired
    private ScoreRecordRepository scoreRecordRepository;

    @Autowired
    private SendRecordRepository sendRecordRepository;

    /**
     * 订单确认
     *
     * @return
     */
    public OrderVO affirm(String memberId, List<String> ids) {
//        memberService.findByOpenId("16");//todo
        Member member = new Member();
        member.setName("李四");
        member.setPhone("13344445555");
        member.setAddress("山东滨州");

        Order order = new Order();
        order.setMemberOpenid(member.getOpenid());
        order.setMemberName(member.getName());
        order.setPhone(member.getPhone());
        order.setAddress(member.getAddress());

        List<OrderItem> orderItemList = new ArrayList<OrderItem>();
        double total = 0;
        for (String id : ids) {
            OrderItem orderItem = new OrderItem();
            CartItem cartItem = cartItemRepository.findById(id);
            if (cartItem == null) {
                continue;
            }
            Product product = productRepository.findById(cartItem.getProductId() + "");
            if (product == null) {
                continue;
            }
            orderItem.setProductId(product.getId());
            orderItem.setName(product.getName());
            orderItem.setXiangXing(product.getXiangXing());
            orderItem.setRongLiang(product.getRongLiang());
            orderItem.setDuShu(product.getDuShu());
            orderItem.setPrice(product.getPrice());
            orderItem.setImage(product.getImage());
            orderItem.setScore(product.getScore());
            orderItem.setIntroduction(product.getIntroduction());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setTotalPrice(orderItem.getQuantity() * orderItem.getPrice());
            orderItemList.add(orderItem);
            total += orderItem.getTotalPrice();
        }
        order.setGrandTotal(total);
        OrderVO orderVO = new OrderVO();
        orderVO.setOrder(order);
        orderVO.setItemList(orderItemList);
        return orderVO;
    }

    /**
     * 1.订单记录
     * 2.积分记录
     * 3.提成记录
     *
     * @param orderVO
     */
    @Override
    public OrderVO create(OrderVO orderVO) {
        int maxId = orderRepository.getMaxId();
        maxId++;
        Order order = orderVO.getOrder();
        order.setMemberOpenid("11");//todo 模拟
        order.setId(maxId);
        order.setOrderTime(System.currentTimeMillis());
        order.setStatus(OrderStatus.NO_PAY.name());

        List<OrderItem> itemList = orderVO.getItemList();
        if (itemList == null || itemList.isEmpty()) {
            throw new ServiceException(200, "请选择商品");
        }
        int itemMaxId = orderItemRepository.getMaxId();
        double grandTotal = 0;
        for (OrderItem orderItem : itemList) {
            itemMaxId++;
            orderItem.setId(itemMaxId);
            orderItem.setOrderId(order.getId());
            grandTotal += orderItem.getPrice() * orderItem.getQuantity();
        }
        order.setGrandTotal(grandTotal);
        orderRepository.create(order);
        orderItemRepository.create(itemList);
        return orderVO;
//todo
//        private long payTime;//付款时间
//        private long sendTime;//发货时间
    }

    /**
     * 付款成功，微信通知，可能重复通知，需要判断
     *
     * @param id
     * @return
     */
    @Override
    public void paySuccess(String id) {
        Order db = orderRepository.findById(id);
        if (db == null) {
            logger.error("订单丢失：" + id);
        }
        String status = db.getStatus();
        if (OrderStatus.NO_PAY.name().equals(status)) {
            db.setStatus(OrderStatus.PAY.name());
            db.setPayTime(System.currentTimeMillis());
            orderRepository.update(db);

        }
    }

    /**
     * 积分变动，并保存积分记录
     *
     * @param db
     * @param currentMember
     */
    private void scoreRecord(Order db, Member currentMember) {
        List<OrderItem> list = orderItemRepository.list(db.getId() + "");
        int score = 0;
        for (OrderItem item : list) {
            score += item.getScore();
        }
        if (score <= 0) {
            return;
        }
        MemberAccount account = memberAccountRepository.findById(currentMember.getId());
        int before = account.getScore();
        account.setScore(before + score);

        int maxId = scoreRecordRepository.getMaxId();
        maxId++;
        ScoreRecord scoreRecord = new ScoreRecord();
        scoreRecord.setId(maxId);
        scoreRecord.setMemberId(currentMember.getId());
        scoreRecord.setOrderId(db.getId());
        scoreRecord.setBefore(before);
        scoreRecord.setScore(score);
        scoreRecord.setAfter(account.getScore());
        scoreRecord.setReason(ScoreChangeReason.XIAO_FEI.name());
        scoreRecord.setTime(System.currentTimeMillis());
        scoreRecord.setStatus(db.getStatus());
        scoreRecordRepository.create(scoreRecord);
        memberAccountRepository.update(account);
    }

    /**
     * @param db      产生佣金的订单
     * @param yongJin 佣金比例
     * @param member  获得佣金的会员
     */
    private void yongJinRecord(Order db, int yongJin, Member member) {
        double grandTotal = db.getGrandTotal();
        double firstYongJin = grandTotal * yongJin / 100;
        MemberAccount higherLevelAccount = memberAccountRepository.findById(member.getId());
        double before = higherLevelAccount.getMoney();
        higherLevelAccount.setMoney(before + firstYongJin);
        int maxId = moneyRecordRepository.getMaxId();
        MoneyRecord moneyRecord = new MoneyRecord();
        maxId++;
        moneyRecord.setId(maxId);
        moneyRecord.setMemberId(member.getId());
        moneyRecord.setOrderId(db.getId());
        moneyRecord.setBefore(before);
        moneyRecord.setMoney(firstYongJin);
        moneyRecord.setAfter(higherLevelAccount.getMoney());
        moneyRecord.setReason(MoneyChangeReason.TI_CHENG.getDescription());
        moneyRecord.setTime(System.currentTimeMillis());
        moneyRecord.setStatus(db.getStatus());
        moneyRecordRepository.create(moneyRecord);
        memberAccountRepository.update(higherLevelAccount);
    }

    @Override
    public void update(Order order) {
        Order db = orderRepository.findById(String.valueOf(order.getId()));

        //todo
        orderRepository.update(db);
    }

    @Override
    public List<OrderVO> list(Map<String, Object> params) {
        List<Order> list = orderRepository.list(params);
        List<OrderVO> voList = new ArrayList<OrderVO>();
        for (Order order : list) {
            List<OrderItem> itemList = orderItemRepository.list(order.getId() + "");
            OrderVO orderVO = new OrderVO();
            orderVO.setOrder(order);
            orderVO.setItemList(itemList);
            voList.add(orderVO);
        }
        return voList;
    }

    @Override
    public OrderVO findById(String id) {
        Order order = orderRepository.findById(id);
        List<OrderItem> itemList = orderItemRepository.list(id);
        OrderVO vo = new OrderVO();
        vo.setOrder(order);
        vo.setItemList(itemList);
        return vo;
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return orderRepository.getCount(params);
    }

    @Override
    public void sendProduct(Map<String, String> sendInfo) {
        String orderId = sendInfo.get("orderId");
        Order order = orderRepository.findById(orderId);
        if (order == null) {
            throw new ServiceException(201, "订单不存在");
        }
        if (OrderStatus.PAY.name().equals(order.getStatus())) {
            String name = sendInfo.get("name");
            String phone = sendInfo.get("phone");
            String address = sendInfo.get("address");
            int maxId = sendRecordRepository.getMaxId();
            maxId++;
            SendRecord sendRecord = new SendRecord();
            sendRecord.setId(maxId);
            sendRecord.setName(name);
            sendRecord.setPhone(phone);
            sendRecord.setAddress(address);
            sendRecord.setOrderId(order.getId());
            sendRecord.setOrderType(OrderType.COMMON.name());
            sendRecord.setTime(System.currentTimeMillis());
            sendRecordRepository.create(sendRecord);
            order.setStatus(OrderStatus.FA_HUO.name());
            order.setSendTime(System.currentTimeMillis());
            orderRepository.update(order);
        }
    }

    @Override
    public void shouHuo(String orderId) {
        Order db = orderRepository.findById(orderId);
        if (OrderStatus.FA_HUO.name().equals(db.getStatus())) {
            db.setStatus(OrderStatus.WAN_CHENG.name());
            orderRepository.update(db);
            //提成
            YongJinSetting yongJinSetting = yongJinSettingRepository.findById(YongJinSettingServiceImpl.ID);
            String memberOpenid = db.getMemberOpenid();
            Member currentMember = memberRepository.findByOpenId(memberOpenid);
            switch (currentMember.getLevel()) {
                case 1:
                    //nothing 没有上级，没有提成
                    break;
                case 2:
                    int yongJin = yongJinSetting.getSecondToFirst();
                    Member higherLevelMember = memberRepository.findByOpenId(currentMember.getHigherLevelOpenId());
                    yongJinRecord(db, yongJin, higherLevelMember);
                    break;
                case 3:
                    int memberToSecond = yongJinSetting.getMemberToSecond();
                    Member secondMember = memberRepository.findByOpenId(currentMember.getHigherLevelOpenId());
                    yongJinRecord(db, memberToSecond, secondMember);
                    int memberToFirst = yongJinSetting.getMemberToFirst();
                    Member firstMember = memberRepository.findByOpenId(secondMember.getHigherLevelOpenId());
                    yongJinRecord(db, memberToFirst, firstMember);
                    break;
                default:
                    break;
            }
            //积分
            scoreRecord(db, currentMember);
        }
    }
}
