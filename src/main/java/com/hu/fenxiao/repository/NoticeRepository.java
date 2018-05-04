package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface NoticeRepository {

    void create(Notice notice);

    void update(Notice notice);

    void delete(String id);

    List<Notice> list(Map<String, Object> params);

    Notice findById(String id);

    int getCount(Map<String, Object> params);

    int getMaxId();

    Notice getTheLastOne();

}
