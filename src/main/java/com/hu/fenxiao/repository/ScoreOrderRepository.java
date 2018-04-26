package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.ScoreOrder;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ScoreOrderRepository {

    void create(ScoreOrder scoreOrder);

    void update(ScoreOrder scoreOrder);

    List<ScoreOrder> list(Map<String, Object> params);

    ScoreOrder findById(String id);

    int getCount(Map<String, Object> params);

    int getMaxId();
}
