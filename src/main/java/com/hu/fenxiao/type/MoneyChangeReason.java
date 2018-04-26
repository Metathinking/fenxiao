package com.hu.fenxiao.type;

public enum MoneyChangeReason {

    TI_CHENG("提成"),
    TI_XIAN("提现");
    private String name;

    private MoneyChangeReason(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.name;
    }
}
