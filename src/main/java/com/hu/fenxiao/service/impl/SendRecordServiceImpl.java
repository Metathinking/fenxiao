package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Order;
import com.hu.fenxiao.domain.ScoreOrder;
import com.hu.fenxiao.domain.SendRecord;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.OrderRepository;
import com.hu.fenxiao.repository.ScoreOrderRepository;
import com.hu.fenxiao.repository.SendRecordRepository;
import com.hu.fenxiao.service.SendRecordService;
import com.hu.fenxiao.type.OrderStatus;
import com.hu.fenxiao.type.OrderType;
import com.hu.fenxiao.type.ScoreOrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SendRecordServiceImpl implements SendRecordService {

    @Autowired
    private SendRecordRepository sendRecordRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ScoreOrderRepository scoreOrderRepository;


    @Override
    public List<SendRecord> list(Map<String, Object> params) {
        return sendRecordRepository.list(params);
    }

    @Override
    public SendRecord findByOrderId(String id, String type) {
        return sendRecordRepository.findByOrderId(id, type);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return sendRecordRepository.getCount(params);
    }


    @Override
    public void sendProduct(SendRecord sendRecord) {
        String type = sendRecord.getOrderType();
        if (OrderType.SCORE.name().equals(type)) {
            int orderId = sendRecord.getOrderId();
            ScoreOrder order = scoreOrderRepository.findById(orderId + "");
            if (order == null) {
                throw new ServiceException(201, "订单不存在");
            }
            if (ScoreOrderStatus.XIA_DAN.name().equals(order.getStatus())) {

                int maxId = sendRecordRepository.getMaxId();
                maxId++;
                sendRecord.setId(maxId);
                sendRecord.setTime(System.currentTimeMillis());
                sendRecordRepository.create(sendRecord);
                order.setStatus(ScoreOrderStatus.FA_HUO.name());
                order.setSendTime(System.currentTimeMillis());
                scoreOrderRepository.update(order);
            }
        } else if (OrderType.COMMON.name().equals(type)) {
            int orderId = sendRecord.getOrderId();
            Order order = orderRepository.findById(orderId+"");
            if (order == null) {
                throw new ServiceException(201, "订单不存在");
            }
            if (OrderStatus.PAY.name().equals(order.getStatus())) {
                int maxId = sendRecordRepository.getMaxId();
                maxId++;
                sendRecord.setId(maxId);
                sendRecord.setTime(System.currentTimeMillis());
                sendRecordRepository.create(sendRecord);
                order.setStatus(OrderStatus.FA_HUO.name());
                order.setSendTime(System.currentTimeMillis());
                orderRepository.update(order);
            }
        } else {
            throw new ServiceException("订单类型错误，请联系管理员");
        }

    }
}
