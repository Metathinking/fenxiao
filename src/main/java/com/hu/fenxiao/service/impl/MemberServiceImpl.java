package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.repository.MemberAccountRepository;
import com.hu.fenxiao.repository.MemberRepository;
import com.hu.fenxiao.service.MemberAccountService;
import com.hu.fenxiao.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private MemberAccountRepository memberAccountRepository;

//    @Override
//    public void test() {
//        for (int i=1;i<100;i++){
//            Member member = new Member();
//            member.setId(10001+i);
//            member.setName("测试人员"+i);
//            member.setPhone("1333333333"+i);
//            member.setAddress("山东滨州");
//            member.setOpenid(member.getId()+"");
//            member.setNickname("测试人员"+i);
//            member.setLevel(1);
//            memberRepository.create(member);
//            MemberAccount account = new MemberAccount();
//            account.setId(member.getId());
//            account.setScore(2000);
//            account.setMoney(2000);
//            memberAccountRepository.create(account);
//        }
//        for (int i=1;i<10;i++){
//            Member member = new Member();
//            member.setId(20001+i);
//            member.setName("测试人员"+i);
//            member.setPhone("1333333333"+i);
//            member.setAddress("山东滨州");
//            member.setOpenid(member.getId()+"");
//            member.setNickname("测试人员"+i);
//            member.setHigherLevelOpenId(10002+"");
//            member.setLevel(2);
//            memberRepository.create(member);
//            MemberAccount account = new MemberAccount();
//            account.setId(member.getId());
//            account.setScore(0);
//            account.setMoney(0);
//            memberAccountRepository.create(account);
//        }
//        for (int i=1;i<5;i++){
//            Member member = new Member();
//            member.setId(30001+i);
//            member.setName("测试人员"+i);
//            member.setPhone("1333333333"+i);
//            member.setAddress("山东滨州");
//            member.setOpenid(member.getId()+"");
//            member.setNickname("测试人员"+i);
//            member.setHigherLevelOpenId(20002+"");
//            member.setLevel(3);
//            memberRepository.create(member);
//            MemberAccount account = new MemberAccount();
//            account.setId(member.getId());
//            account.setScore(0);
//            account.setMoney(0);
//            memberAccountRepository.create(account);
//        }
//    }

    public Member edit(Member member) {
        Member db = findByOpenId(member.getOpenid());
        if (db == null) {
            int maxId = memberRepository.getMaxId();
            maxId++;
            member.setId(maxId);
            member.setName(member.getNickname());
            member.setTime(System.currentTimeMillis());
            memberRepository.create(member);
            MemberAccount account = new MemberAccount();
            account.setId(member.getId());
            account.setScore(0);
            account.setMoney(0);
            memberAccountRepository.create(account);
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
