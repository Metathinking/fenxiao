package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.Order;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface OrderRepository {

    void create(Order order);

    void update(Order order);

    List<Order> list(Map<String,Object> params);

    Order findById(String id);

    int getCount(Map<String,Object> params);

    int getMaxId();
}
