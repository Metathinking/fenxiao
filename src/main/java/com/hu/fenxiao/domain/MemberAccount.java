package com.hu.fenxiao.domain;

public class MemberAccount {

    private int id;
    private double xiaoFeiMoney;//金额
    private double leiJiMoney;//累计提成
    private double money;//剩余金额
    private int leiJiScore;//累计积分
    private int score;//剩余积分

    public double getXiaoFeiMoney() {
        return xiaoFeiMoney;
    }

    public void setXiaoFeiMoney(double xiaoFeiMoney) {
        this.xiaoFeiMoney = xiaoFeiMoney;
    }

    public double getLeiJiMoney() {
        return leiJiMoney;
    }

    public void setLeiJiMoney(double leiJiMoney) {
        this.leiJiMoney = leiJiMoney;
    }

    public int getLeiJiScore() {
        return leiJiScore;
    }

    public void setLeiJiScore(int leiJiScore) {
        this.leiJiScore = leiJiScore;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
