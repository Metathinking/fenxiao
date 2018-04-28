package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.ScoreRecord;

import java.util.List;
import java.util.Map;

public interface ScoreRecordService {

    List<ScoreRecord> list(Map<String,Object> params);

    int getCount(Map<String,Object> params);
}
