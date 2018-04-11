package com.hu.fenxiao.domain;

public class ScoreRecord {

    private int id;
    private int memberId;
    private double before;//变动之前的金额
    private double score;//变动金额 ，可为负
    private double after;//变动之后的金额
    private String reason;//变动原因
    private long time;//时间
}
