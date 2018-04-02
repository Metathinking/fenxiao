package com.hu.fenxiao.domain;

import java.math.BigDecimal;
import java.util.Map;

public class Cart {

    private int id;//与会员id一致
    private Map<String,Item> itemMap;
    private BigDecimal grandTotal;
}
