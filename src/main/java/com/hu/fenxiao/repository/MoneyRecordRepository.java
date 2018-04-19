package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.MoneyRecord;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MoneyRecordRepository {

    void create(MoneyRecord moneyRecord);

    void update(MoneyRecord moneyRecord);

    List<MoneyRecord> list(Map<String,Object> params);

    MoneyRecord findById(String id);

    int getMaxId();

    int getCount(Map<String,Object> params);
}
