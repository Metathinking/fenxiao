package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.repository.MemberRepository;
import com.hu.fenxiao.repository.OrderRepository;
import com.hu.fenxiao.service.OrderService;
import com.hu.fenxiao.type.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Override
    public void create(Order order) {
        int maxId = orderRepository.getMaxId();
        maxId++;
        order.setId(maxId);
        Member member = memberRepository.findByOpenId(order.getMemberOpenid());
        order.setMemberName(member.getNickname());
        order.setOrderTime(System.currentTimeMillis());
        order.setStatus(OrderStatus.NO_PAY.name());

        memberRepository.create(member);
        //todo
//        private double grandTotal;//总价
//        private long orderTime;//下单时间
//        private long payTime;//付款时间
//        private long sendTime;//发货时间
//        private String status;//状态
//        private String remark;//备注信息,可以为null
    }

    @Override
    public void update(Order order) {
        Order db = orderRepository.findById(String.valueOf(order.getId()));

        //todo

        orderRepository.update(db);
    }

    @Override
    public List<Order> list(Map<String, Object> params) {
        return orderRepository.list(params);
    }

    @Override
    public Order findById(String id) {
        return orderRepository.findById(id);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return orderRepository.getCount(params);
    }
}
