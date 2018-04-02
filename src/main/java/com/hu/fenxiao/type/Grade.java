package com.hu.fenxiao.type;

public enum Grade {

    FIRST_GRADE("一级"),
    SECOND_GRADE("二级"),
    MEMBER_GRADE("会员");
    private String name;

    private Grade(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.name;
    }
}
