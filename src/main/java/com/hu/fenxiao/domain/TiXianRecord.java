package com.hu.fenxiao.domain;

/**
 * 提现记录
 */
public class TiXianRecord {

    private int id;
    private int memberId;
    private String memberName;
    private String memberPhone;
    private double money;//金额
    private long requestTime;//时间
    private long overTime;
    /**
     * @see com.hu.fenxiao.type.TiXianStatus
     */
    private String status;
    private String memberWords;//用户留言
    private String info;//审核信息

    public String getMemberWords() {
        return memberWords;
    }

    public void setMemberWords(String memberWords) {
        this.memberWords = memberWords;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public long getRequestTime() {
        return requestTime;
    }

    public void setRequestTime(long requestTime) {
        this.requestTime = requestTime;
    }

    public long getOverTime() {
        return overTime;
    }

    public void setOverTime(long overTime) {
        this.overTime = overTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
