package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.OrderItem;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository {

    void create(List<OrderItem> orderItemList);

    List<OrderItem> list(String orderId);

    int getMaxId();
}
