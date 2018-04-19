package com.hu.fenxiao.domain;

public class MoneyRecord {

    private int id;
    private int memberId;
    private int orderId;
    private double before;//变动之前的金额
    private double money;//变动金额 ，可为负
    private double after;//变动之后的金额
    private String reason;//变动原因
    private long time;//时间
    /**
     * @see com.hu.fenxiao.type.OrderStatus
     */
    private String status;

}
