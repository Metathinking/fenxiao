package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.ScoreRecord;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ScoreRecordRepository {

    void create(ScoreRecord scoreRecord);

    void update(ScoreRecord scoreRecord);

    List<ScoreRecord> list(Map<String,Object> params);

    ScoreRecord findById(String id);

    int getMaxId();

    int getCount(Map<String,Object> params);
}
