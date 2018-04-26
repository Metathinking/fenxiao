package com.hu.fenxiao.type;

public enum  OrderType {

    COMMON("普通商品"),
    SCORE("积分商品");

    private String name;

    private OrderType(String name) {
        this.name = name;
    }

    public String getDescription(){
        return this.name;
    }
}
