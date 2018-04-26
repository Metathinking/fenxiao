package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.SendRecord;
import com.hu.fenxiao.repository.SendRecordRepository;
import com.hu.fenxiao.service.SendRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SendRecordServiceImpl implements SendRecordService {

    @Autowired
    private SendRecordRepository sendRecordRepository;



    @Override
    public List<SendRecord> list(Map<String, Object> params) {
        return sendRecordRepository.list(params);
    }

    @Override
    public SendRecord findByOrderId(String id,String type) {
        return sendRecordRepository.findByOrderId(id,type);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return sendRecordRepository.getCount(params);
    }
}
