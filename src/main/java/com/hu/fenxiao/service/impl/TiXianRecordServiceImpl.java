package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.domain.TiXianRecord;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.MemberAccountRepository;
import com.hu.fenxiao.repository.MemberRepository;
import com.hu.fenxiao.repository.TiXianRecordRepository;
import com.hu.fenxiao.service.TiXianRecordService;
import com.hu.fenxiao.type.TiXianStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TiXianRecordServiceImpl implements TiXianRecordService {

    @Autowired
    private TiXianRecordRepository tiXianRecordRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberAccountRepository memberAccountRepository;

    @Override
    public void create(int memberId, double money) {
        MemberAccount memberAccount = memberAccountRepository.findById(memberId);
        if (memberAccount.getMoney() < money) {
            throw new ServiceException("账户余额不足！");
        }
        //不可以重复申请
        List<TiXianRecord> tiXianRecordList = tiXianRecordRepository.listByMemberIdAndStatus(memberId, TiXianStatus.REQUEST.name());
        if (tiXianRecordList != null && tiXianRecordList.size() > 0) {
            throw new ServiceException("您存在未审核的申请，请不要重复申请");
        }
        Member member = memberRepository.findById(memberId);
        int maxId = tiXianRecordRepository.getMaxId();
        maxId++;
        TiXianRecord tiXianRecord = new TiXianRecord();
        tiXianRecord.setId(maxId);
        tiXianRecord.setMemberId(member.getId());
        tiXianRecord.setMemberName(member.getName());
        tiXianRecord.setMemberPhone(member.getPhone());
        tiXianRecord.setMoney(money);
        tiXianRecord.setRequestTime(System.currentTimeMillis());
        tiXianRecord.setStatus(TiXianStatus.REQUEST.name());
        tiXianRecordRepository.create(tiXianRecord);
    }

    @Override
    public void update(TiXianRecord tiXianRecord) {

    }

    @Override
    public List<TiXianRecord> list(Map<String, Object> params) {
        return tiXianRecordRepository.list(params);
    }

    @Override
    public TiXianRecord findById(String id) {
        return tiXianRecordRepository.findById(id);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return tiXianRecordRepository.getCount(params);
    }

    @Override
    public void shenHe(TiXianRecord tiXianRecord) {
        TiXianRecord db = tiXianRecordRepository.findById(tiXianRecord.getId() + "");
        if (db == null) {
            throw new ServiceException("系统错误，请刷新后重试");
        }
        MemberAccount memberAccount = memberAccountRepository.findById(db.getMemberId());
        if (memberAccount.getMoney() < db.getMoney()) {
            throw new ServiceException("账户余额不足！");
        }
        memberAccount.setMoney(memberAccount.getMoney() - db.getMoney());
        memberAccountRepository.update(memberAccount);
        db.setOverTime(System.currentTimeMillis());
        db.setStatus(TiXianStatus.OVER.name());
        tiXianRecordRepository.update(db);
    }
}
