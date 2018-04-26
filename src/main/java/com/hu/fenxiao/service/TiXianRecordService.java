package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.TiXianRecord;

import java.util.List;
import java.util.Map;

public interface TiXianRecordService {

    void create(int memberId,double money);

    void update(TiXianRecord tiXianRecord);

    List<TiXianRecord> list(Map<String,Object> params);

    TiXianRecord findById(String id);

    int getCount(Map<String,Object> params);

    void shenHe(TiXianRecord tiXianRecord);
}
