package com.hu.fenxiao.type;

public enum TiXianStatus {

    REQUEST("待审核"),
    REFUSE("审核未通过"),
    CANCEL("已取消"),
    OVER("完成");

    private String name;

    private TiXianStatus(String name) {
        this.name = name;
    }

    public String getDescription(){
        return this.name;
    }
}
