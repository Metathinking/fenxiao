package com.hu.fenxiao.type;

public enum OrderStatus {

    XIA_DAN("下单"),
    FA_HUO("发货"),
    WAN_CHENG("完成");

    private String name;

    private OrderStatus(String name) {
        this.name = name;
    }

    public String getDescription(){
        return this.name;
    }
}
