package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.domain.TuiGuangSetting;
import com.hu.fenxiao.repository.MemberAccountRepository;
import com.hu.fenxiao.repository.TuiGuangSettingRepository;
import com.hu.fenxiao.service.MemberAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAccountServiceImpl implements MemberAccountService {

    @Autowired
    private MemberAccountRepository memberAccountRepository;

    @Autowired
    private TuiGuangSettingRepository tuiGuangSettingRepository;

    @Override
    public MemberAccount findById(int id) {
        return memberAccountRepository.findById(id);
    }

    @Override
    public boolean hasTuiGuangPower(int memberId) {
        TuiGuangSetting tuiGuangSetting = tuiGuangSettingRepository.findById(TuiGuangSettingServiceImpl.ID);
        MemberAccount account = memberAccountRepository.findById(memberId);
        if (account.getXiaoFeiMoney() >= tuiGuangSetting.getMoney()) {
            return true;
        } else {
            return false;
        }
    }
}
