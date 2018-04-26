package com.hu.fenxiao.type;

public enum ScoreChangeReason {

    XIAO_FEI("消费"),
    JI_FEN_DUI_HUAN("积分兑换");
    private String name;

    private ScoreChangeReason(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.name;
    }
}
