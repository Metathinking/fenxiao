package com.hu.fenxiao.domain;

import java.math.BigDecimal;
import java.util.List;

public class Order {

    private int id;
    private int memberId;
    private List<Item> itemList;
    private BigDecimal grandTotal;//总价
    private long time;//时间
    private String status;//状态
    private String remark;//备注信息,可以为null

}
