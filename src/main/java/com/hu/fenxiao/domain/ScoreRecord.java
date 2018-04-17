package com.hu.fenxiao.domain;

public class ScoreRecord {

    private int id;
    private int memberId;
    private int orderId;//订单编号
    private double before;//变动之前的金额
    private double score;//变动金额 ，可为负
    private double after;//变动之后的金额
    private String reason;//变动原因
    private long time;//时间
    /**
     * @see com.hu.fenxiao.type.OrderStatus
     */
    private String status;//状态

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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public double getBefore() {
        return before;
    }

    public void setBefore(double before) {
        this.before = before;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double getAfter() {
        return after;
    }

    public void setAfter(double after) {
        this.after = after;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
