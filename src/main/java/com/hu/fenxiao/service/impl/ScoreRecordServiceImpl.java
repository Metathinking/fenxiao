package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.ScoreRecord;
import com.hu.fenxiao.repository.ScoreRecordRepository;
import com.hu.fenxiao.service.ScoreRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScoreRecordServiceImpl implements ScoreRecordService {

    @Autowired
    private ScoreRecordRepository scoreRecordRepository;

    @Override
    public List<ScoreRecord> list(Map<String, Object> params) {
        return scoreRecordRepository.list(params);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return scoreRecordRepository.getCount(params);
    }
}
