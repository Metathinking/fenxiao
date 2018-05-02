package com.hu.fenxiao.domain.vo;

import com.hu.fenxiao.domain.Member;

import java.util.List;

public class MemberVO {

    private Member member;//会员
    private List<Object> tuiGuangList;//会员推广的成员
    private int level;//会员所在位置：1,2,3

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public List<Object> getTuiGuangList() {
        return tuiGuangList;
    }

    public void setTuiGuangList(List<Object> tuiGuangList) {
        this.tuiGuangList = tuiGuangList;
    }
}
