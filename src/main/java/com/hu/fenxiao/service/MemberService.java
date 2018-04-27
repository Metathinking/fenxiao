package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Member;

import java.util.List;
import java.util.Map;

public interface MemberService {

//    void test();

    Member edit(Member member);

    List<Member> list(Map<String, Object> params);

    int getCount(Map<String, Object> params);

    Member findByOpenId(String openid);

}
