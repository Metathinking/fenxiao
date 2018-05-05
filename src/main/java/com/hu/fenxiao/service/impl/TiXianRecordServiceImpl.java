package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.domain.MoneyRecord;
import com.hu.fenxiao.domain.TiXianRecord;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.MemberAccountRepository;
import com.hu.fenxiao.repository.MemberRepository;
import com.hu.fenxiao.repository.MoneyRecordRepository;
import com.hu.fenxiao.repository.TiXianRecordRepository;
import com.hu.fenxiao.service.TiXianRecordService;
import com.hu.fenxiao.type.MoneyChangeReason;
import com.hu.fenxiao.type.OrderStatus;
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

    @Autowired
    private MoneyRecordRepository moneyRecordRepository;

    @Override
    public void create(int memberId, double money, String memberWords, String phone) {
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
        tiXianRecord.setMemberPhone(phone);
        tiXianRecord.setMoney(money);
        tiXianRecord.setRequestTime(System.currentTimeMillis());
        tiXianRecord.setMemberWords(memberWords);
        tiXianRecord.setStatus(TiXianStatus.REQUEST.name());
        tiXianRecordRepository.create(tiXianRecord);
        //更新用户信息
        member.setPhone(phone);
        memberRepository.update(member);
    }

//    @Override
//    public void update(TiXianRecord tiXianRecord) {
//
//    }

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
    public void shenHe(TiXianRecord tiXianRecord, boolean isPass) {
        TiXianRecord db = tiXianRecordRepository.findById(tiXianRecord.getId() + "");
        if (db == null) {
            throw new ServiceException("系统错误，请刷新后重试");
        }
        if (isPass) {//审核通过
            MemberAccount memberAccount = memberAccountRepository.findById(db.getMemberId());
            if (memberAccount.getMoney() < db.getMoney()) {
                throw new ServiceException("账户余额不足！");
            }
            double before = memberAccount.getMoney();
            memberAccount.setMoney(memberAccount.getMoney() - db.getMoney());
            memberAccountRepository.update(memberAccount);

            addMoneyRecord(db, memberAccount, before);

            db.setOverTime(System.currentTimeMillis());
            db.setStatus(TiXianStatus.OVER.name());
            db.setInfo(tiXianRecord.getInfo());
            tiXianRecordRepository.update(db);
        } else {//审核未通过
            db.setOverTime(System.currentTimeMillis());
            db.setStatus(TiXianStatus.REFUSE.name());
            db.setInfo(tiXianRecord.getInfo());
            tiXianRecordRepository.update(db);
        }
    }


    @Override
    public void cancel(String id) {
        TiXianRecord record = tiXianRecordRepository.findById(id);
        if (TiXianStatus.REQUEST.name().equals(record.getStatus())) {
            record.setStatus(TiXianStatus.CANCEL.name());
            tiXianRecordRepository.update(record);
        } else {
            throw new ServiceException("只有待审核状态下可以取消");
        }
    }

    /**
     * 保存资金变动记录
     *
     * @param db
     * @param memberAccount
     * @param before
     */
    private void addMoneyRecord(TiXianRecord db, MemberAccount memberAccount, double before) {
        MoneyRecord moneyRecord = new MoneyRecord();
        int maxId = moneyRecordRepository.getMaxId();
        maxId++;
        moneyRecord.setId(maxId);
        moneyRecord.setMemberId(db.getMemberId());
        moneyRecord.setOrderId(db.getId());
        moneyRecord.setBefore(before);
        moneyRecord.setMoney(-db.getMoney());
        moneyRecord.setAfter(memberAccount.getMoney());
        moneyRecord.setReason(MoneyChangeReason.TI_XIAN.name());
        moneyRecord.setTime(System.currentTimeMillis());
        moneyRecord.setStatus(OrderStatus.WAN_CHENG.name());
        moneyRecordRepository.create(moneyRecord);
    }
}
