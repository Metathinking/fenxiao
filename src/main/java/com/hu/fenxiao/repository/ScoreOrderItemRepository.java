package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.ScoreOrderItem;
import org.springframework.stereotype.Repository;


@Repository
public interface ScoreOrderItemRepository {

    void create(ScoreOrderItem scoreOrderItem);

   ScoreOrderItem findByOrderId(String orderId);

    int getMaxId();
}
