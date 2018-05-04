package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

    Notice create(String content);

    Notice update(Notice notice);

    void delete(String id);

    List<Notice> list(Map<String, Object> params);

    int getCount(Map<String, Object> params);

    Notice getTheLastOne();

    void updateToNew(String id);
}
