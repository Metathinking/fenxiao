package com.hu.fenxiao.type;

public enum TiXianStatus {

    REQUEST("待审核"),
    OVER("完成");

    private String name;

    private TiXianStatus(String name) {
        this.name = name;
    }

    public String getDescription(){
        return this.name;
    }
}
