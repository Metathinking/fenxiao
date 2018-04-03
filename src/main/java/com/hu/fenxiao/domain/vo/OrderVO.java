package com.hu.fenxiao.domain.vo;

import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.OrderItem;

import java.util.List;

public class OrderVO  {

    private Order order;
    private List<OrderItem> itemList;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OrderItem> itemList) {
        this.itemList = itemList;
    }
}
