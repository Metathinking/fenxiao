package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.vo.OrderVO;

import java.util.List;
import java.util.Map;

public interface OrderService {

    OrderVO affirm(String memberId,List<String> ids);

    void create(OrderVO orderVO);

    void update(Order order);

    List<Order> list(Map<String,Object> params);

    Order findById(String id);

    int getCount(Map<String,Object> params);

}
