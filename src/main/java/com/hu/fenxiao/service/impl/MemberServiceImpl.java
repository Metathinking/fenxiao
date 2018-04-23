package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.repository.MemberRepository;
import com.hu.fenxiao.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public Member edit(Member member) {
        Member db = findByOpenId(member.getOpenid());
        if (db == null) {
            int maxId = memberRepository.getMaxId();
            maxId++;
            member.setId(maxId);
            member.setName(member.getNickname());
            member.setTime(System.currentTimeMillis());
            memberRepository.create(member);
            return member;
        } else {
            db.setName(member.getName());
            db.setPhone(member.getPhone());
            db.setAddress(member.getAddress());
            db.setUnionid(member.getUnionid());
            db.setNickname(member.getNickname());
            db.setSex(member.getSex());
            db.setProvince(member.getProvince());
            db.setCity(member.getCity());
            db.setCountry(member.getCountry());
            db.setHeadimgurl(member.getHeadimgurl());
            db.setTime(System.currentTimeMillis());
            memberRepository.update(db);
            return db;
        }
    }

    @Override
    public List<Member> list(Map<String, Object> params) {
        return memberRepository.list(params);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return memberRepository.getCount(params);
    }

    @Override
    public Member findByOpenId(String openid) {
        return memberRepository.findByOpenId(openid);
    }
}
