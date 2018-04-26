package com.hu.fenxiao.domain.vo;

import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.OrderItem;
import com.hu.fenxiao.domain.ScoreOrder;
import com.hu.fenxiao.domain.ScoreOrderItem;

import java.util.List;

public class ScoreOrderVO {

    private ScoreOrder scoreOrder;
    private ScoreOrderItem scoreOrderItem;

    public ScoreOrder getScoreOrder() {
        return scoreOrder;
    }

    public void setScoreOrder(ScoreOrder scoreOrder) {
        this.scoreOrder = scoreOrder;
    }

    public ScoreOrderItem getScoreOrderItem() {
        return scoreOrderItem;
    }

    public void setScoreOrderItem(ScoreOrderItem scoreOrderItem) {
        this.scoreOrderItem = scoreOrderItem;
    }
}
