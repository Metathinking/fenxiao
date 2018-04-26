package com.hu.fenxiao.service;


import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.ScoreOrder;
import com.hu.fenxiao.domain.vo.ScoreOrderVO;

import java.util.List;
import java.util.Map;

public interface ScoreOrderService {

    ScoreOrderVO create(ScoreOrderVO orderVO,Member member);

    void update(ScoreOrder order);

    List<ScoreOrderVO> list(Map<String, Object> params);

    ScoreOrderVO findById(String id);

    int getCount(Map<String, Object> params);

//    void sendProduct(Map<String, String> sendInfo);

    void shouHuo(String orderId);
}
