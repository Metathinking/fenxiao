package com.hu.fenxiao.domain;

/**
 * 推广设置
 */
public class TuiGuangSetting {

    private int id;
    private double money;//获取推广资格所需金额
    private int first;//一级会员消费佣金比例
    private int second;//二级会员消费佣金比例
    private int third;//三级会员消费佣金比例

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

    public int getFirst() {
        return first;
    }

    public void setFirst(int first) {
        this.first = first;
    }

    public int getSecond() {
        return second;
    }

    public void setSecond(int second) {
        this.second = second;
    }

    public int getThird() {
        return third;
    }

    public void setThird(int third) {
        this.third = third;
    }
}
