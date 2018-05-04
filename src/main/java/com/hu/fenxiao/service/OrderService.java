package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.vo.OrderVO;

import java.util.List;
import java.util.Map;

public interface OrderService {

    OrderVO affirm(String memberOpenId, List<String> ids);

    OrderVO create(OrderVO orderVO);

    void paySuccess(String id);

    void update(Order order);

    List<OrderVO> list(Map<String, Object> params);

    OrderVO findById(String id);

    int getCount(Map<String, Object> params);

//    void sendProduct(Map<String, String> sendInfo);

    void shouHuo(String orderId,String memberOpenid);

    OrderVO rePay(String orderId, String memberOpenid);

    void cancel(String orderId, String openid);
}
