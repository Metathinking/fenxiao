package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Notice;
import com.hu.fenxiao.repository.NoticeRepository;
import com.hu.fenxiao.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;

    @Override
    public Notice create(String content) {
        int maxId = noticeRepository.getMaxId();
        maxId++;
        Notice notice = new Notice();
        notice.setId(maxId);
        notice.setContent(content);
        notice.setTime(System.currentTimeMillis());
        noticeRepository.create(notice);
        return notice;
    }

    @Override
    public Notice update(Notice notice) {
        Notice db = noticeRepository.findById(notice.getId() + "");
        db.setContent(notice.getContent());
        db.setTime(System.currentTimeMillis());
        noticeRepository.update(db);
        return db;
    }

    @Override
    public void delete(String id) {
        noticeRepository.delete(id);
    }

    @Override
    public List<Notice> list(Map<String, Object> params) {
        return noticeRepository.list(params);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return noticeRepository.getCount(params);
    }

    /**
     * 获取最新公告
     *
     * @return
     */
    @Override
    public Notice getTheLastOne() {
        return noticeRepository.getTheLastOne();
    }

    @Override
    public void updateToNew(String id) {
        Notice db = noticeRepository.findById(id);
        db.setTime(System.currentTimeMillis());
        noticeRepository.update(db);
    }
}
