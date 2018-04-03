package com.hu.fenxiao.type;

public enum OrderStatus {

    NO_PAY("未付款"),
    PAY("付款"),
    FA_HUO("发货"),
    WAN_CHENG("完成"),
    CLOSE("关闭");

    private String name;

    private OrderStatus(String name) {
        this.name = name;
    }

    public String getDescription(){
        return this.name;
    }
}
