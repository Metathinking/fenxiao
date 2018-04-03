package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.Member;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MemberRepository {

    void create(Member member);

    void update(Member member);

    List<Member> list(Map<String,Object> params);

    int getCount(Map<String,Object> params);

    Member findByOpenId(String openid);

    int getMaxId();
}
