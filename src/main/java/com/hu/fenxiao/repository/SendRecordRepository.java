package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.SendRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface SendRecordRepository {

    void create(SendRecord sendRecord);

    List<SendRecord> list(Map<String, Object> params);

    SendRecord findByOrderId(@Param("orderId") String orderId,@Param("orderType") String type);

    int getMaxId();

    int getCount(Map<String, Object> params);
}
