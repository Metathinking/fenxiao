package com.hu.fenxiao.domain;

/**
 * 佣金设置
 */
public class YongJinSetting {

    private int id;
    private int secondToFirst;//二级会员订单，一级会员抽取佣金
    private int memberToFirst;//三级会员订单，一级会员抽取佣金
    private int memberToSecond;//三级会员订单，二级会员抽取佣金

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSecondToFirst() {
        return secondToFirst;
    }

    public void setSecondToFirst(int secondToFirst) {
        this.secondToFirst = secondToFirst;
    }

    public int getMemberToFirst() {
        return memberToFirst;
    }

    public void setMemberToFirst(int memberToFirst) {
        this.memberToFirst = memberToFirst;
    }

    public int getMemberToSecond() {
        return memberToSecond;
    }

    public void setMemberToSecond(int memberToSecond) {
        this.memberToSecond = memberToSecond;
    }
}
