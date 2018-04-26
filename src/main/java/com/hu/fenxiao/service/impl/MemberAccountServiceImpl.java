package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.repository.MemberAccountRepository;
import com.hu.fenxiao.service.MemberAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAccountServiceImpl implements MemberAccountService {

    @Autowired
    private MemberAccountRepository memberAccountRepository;

    @Override
    public MemberAccount findById(int id) {
        return memberAccountRepository.findById(id);
    }
}
