package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.SendRecord;

import java.util.List;
import java.util.Map;

public interface SendRecordService {


    List<SendRecord> list(Map<String, Object> params);

    SendRecord findByOrderId(String id,String type);

    int getCount(Map<String, Object> params);
}
