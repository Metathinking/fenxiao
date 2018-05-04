package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.OrderItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemRepository {

    void create(List<OrderItem> orderItemList);

    void update(@Param(value = "itemList") List<OrderItem> orderItemList, @Param(value = "orderId") int orderId);

    List<OrderItem> list(String orderId);

    int getMaxId();

    void deleteByOrderId(String orderId);
}
