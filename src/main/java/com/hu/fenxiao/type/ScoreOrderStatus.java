package com.hu.fenxiao.type;

public enum ScoreOrderStatus {

    XIA_DAN("已下单"),
    FA_HUO("发货"),
    WAN_CHENG("完成");

    private String name;

    private ScoreOrderStatus(String name) {
        this.name = name;
    }

    public String getDescription(){
        return this.name;
    }
}
