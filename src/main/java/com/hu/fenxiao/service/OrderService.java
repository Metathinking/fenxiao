package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.vo.OrderVO;

import java.util.List;
import java.util.Map;

public interface OrderService {

    OrderVO affirm(String memberId,List<String> ids);

    OrderVO create(OrderVO orderVO);

    void paySuccess(String id);

    void update(Order order);

    List<OrderVO> list(Map<String,Object> params);

    Order findById(String id);

    int getCount(Map<String,Object> params);

    void sendProduct(Map<String, String> sendInfo);
}
