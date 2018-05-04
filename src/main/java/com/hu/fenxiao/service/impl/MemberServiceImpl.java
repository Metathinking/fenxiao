package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.MemberAccount;
import com.hu.fenxiao.domain.vo.MemberVO;
import com.hu.fenxiao.repository.MemberAccountRepository;
import com.hu.fenxiao.repository.MemberRepository;
import com.hu.fenxiao.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
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
////        for (int i = 1; i < 2; i++) {
////            Member member = new Member();
////            member.setId(10001 + i);
////            member.setName("测试人员" + i);
////            member.setPhone("1333333333" + i);
////            member.setAddress("山东滨州");
////            member.setOpenid(member.getId() + "");
////            member.setNickname("测试人员" + i);
////            member.setLevel(1);
////            memberRepository.create(member);
////            MemberAccount account = new MemberAccount();
////            account.setId(member.getId());
////            account.setScore(2000);
////            account.setMoney(2000);
////            memberAccountRepository.create(account);
////        }
//        for (int i = 1; i < 10; i++) {
//            Member member = new Member();
//            member.setId(20001 + i);
//            member.setName("测试人员" + i);
//            member.setPhone("1333333333" + i);
//            member.setAddress("山东滨州");
//            member.setOpenid(member.getId() + "");
//            member.setNickname("测试人员" + i);
//            member.setHigherLevelOpenId(10002 + "");
//            member.setLevel(2);
//            memberRepository.create(member);
//            MemberAccount account = new MemberAccount();
//            account.setId(member.getId());
//            account.setScore(0);
//            account.setMoney(0);
//            memberAccountRepository.create(account);
//        }
//        for (int i = 1; i < 5; i++) {
//            Member member = new Member();
//            member.setId(30001 + i);
//            member.setName("测试人员" + i);
//            member.setPhone("1333333333" + i);
//            member.setAddress("山东滨州");
//            member.setOpenid(member.getId() + "");
//            member.setNickname("测试人员" + i);
//            member.setHigherLevelOpenId(20002 + "");
//            member.setLevel(3);
//            memberRepository.create(member);
//            MemberAccount account = new MemberAccount();
//            account.setId(member.getId());
//            account.setScore(0);
//            account.setMoney(0);
//            memberAccountRepository.create(account);
//        }
//    }

    /**
     * @param member
     * @param tuiGuangMemberId 推广人id ，可能为null
     * @return
     */
    public Member edit(Member member, Integer tuiGuangMemberId) {
        Member db = findByOpenId(member.getOpenid());
        if (db == null) {
            //保存推广人员信息
            if (tuiGuangMemberId != null && tuiGuangMemberId != 0) {
                Member tuiGuangRen = memberRepository.findById(tuiGuangMemberId);
                if (tuiGuangRen != null) {
                    member.setHigherLevelOpenId(tuiGuangRen.getOpenid());
                }
            }
            int maxId = memberRepository.getMaxId();
            maxId++;
            member.setId(maxId);
            member.setName(member.getNickname());
            member.setTime(System.currentTimeMillis());
            if(StringUtils.isEmpty(member.getName())){
                member.setName("会员"+member.getId());
            }
            memberRepository.create(member);
            //同步创建账户
            MemberAccount account = new MemberAccount();
            account.setId(member.getId());
            account.setXiaoFeiMoney(0);
            account.setLeiJiMoney(0);
            account.setMoney(0);
            account.setLeiJiScore(0);
            account.setScore(0);
            memberAccountRepository.create(account);
            return member;
        } else {
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

    @Override
    public MemberVO getTuiGuangList(Map<String, Object> params, String memberOpenId) {
        //一级会员
        List<Member> firstList = memberRepository.list(params);
        List memberVOList = new ArrayList<>();
        Member topMember = memberRepository.findByOpenId(memberOpenId);
        for (Member firstMember : firstList) {
            MemberVO firstMemberVO = new MemberVO();
            firstMemberVO.setMember(firstMember);
            firstMemberVO.setLevel(2);
            //二级会员
            List<Member> secondList = memberRepository.listByHigherLevelOpenId(firstMember.getOpenid());
            List secondVOList = new ArrayList<>();
            for (Member secondMember : secondList) {
                MemberVO secondMemberVO = new MemberVO();
                secondMemberVO.setMember(secondMember);
                secondMemberVO.setLevel(3);
                //三级会员
                List thirdList = memberRepository.listByHigherLevelOpenId(secondMember.getOpenid());
                secondMemberVO.setTuiGuangList(thirdList);
                secondVOList.add(secondMemberVO);
            }
            firstMemberVO.setTuiGuangList(secondVOList);
            memberVOList.add(firstMemberVO);
        }
        MemberVO memberVO = new MemberVO();
        memberVO.setMember(topMember);
        memberVO.setTuiGuangList(memberVOList);
        memberVO.setLevel(1);
        return memberVO;
    }
}
