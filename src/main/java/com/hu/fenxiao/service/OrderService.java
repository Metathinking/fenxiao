package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Order;

import java.util.List;
import java.util.Map;

public interface OrderService {

    void create(Order order);

    void update(Order order);

    List<Order> list(Map<String,Object> params);

    Order findById(String id);

    int getCount(Map<String,Object> params);

}
