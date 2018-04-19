package com.hu.fenxiao.repository;


import com.hu.fenxiao.domain.MemberAccount;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MemberAccountRepository {

    void create(MemberAccount memberAccount);

    void update(MemberAccount memberAccount);

    List<MemberAccount> list(Map<String,Object> params);

    MemberAccount findById(int id);

    int getCount(Map<String,Object> params);
}
