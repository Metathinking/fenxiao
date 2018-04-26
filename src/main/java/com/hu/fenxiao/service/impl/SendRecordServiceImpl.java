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
    public void sendProduct(Map<String, String> sendInfo) {
        String type = sendInfo.get("type");
        if (OrderType.SCORE.name().equals(type)) {
            String orderId = sendInfo.get("orderId");
            ScoreOrder order = scoreOrderRepository.findById(orderId);
            if (order == null) {
                throw new ServiceException(201, "订单不存在");
            }
            if (ScoreOrderStatus.XIA_DAN.name().equals(order.getStatus())) {
                String name = sendInfo.get("name");
                String phone = sendInfo.get("phone");
                String address = sendInfo.get("address");
                int maxId = sendRecordRepository.getMaxId();
                maxId++;
                SendRecord sendRecord = new SendRecord();
                sendRecord.setId(maxId);
                sendRecord.setName(name);
                sendRecord.setPhone(phone);
                sendRecord.setAddress(address);
                sendRecord.setOrderId(order.getId());
                sendRecord.setOrderType(OrderType.SCORE.name());
                sendRecord.setTime(System.currentTimeMillis());
                sendRecordRepository.create(sendRecord);
                order.setStatus(ScoreOrderStatus.FA_HUO.name());
                order.setSendTime(System.currentTimeMillis());
                scoreOrderRepository.update(order);
            }
        } else if (OrderType.COMMON.name().equals(type)) {
            String orderId = sendInfo.get("orderId");
            Order order = orderRepository.findById(orderId);
            if (order == null) {
                throw new ServiceException(201, "订单不存在");
            }
            if (OrderStatus.PAY.name().equals(order.getStatus())) {
                String name = sendInfo.get("name");
                String phone = sendInfo.get("phone");
                String address = sendInfo.get("address");
                int maxId = sendRecordRepository.getMaxId();
                maxId++;
                SendRecord sendRecord = new SendRecord();
                sendRecord.setId(maxId);
                sendRecord.setName(name);
                sendRecord.setPhone(phone);
                sendRecord.setAddress(address);
                sendRecord.setOrderId(order.getId());
                sendRecord.setOrderType(OrderType.COMMON.name());
                sendRecord.setTime(System.currentTimeMillis());
                sendRecordRepository.create(sendRecord);
                order.setStatus(OrderStatus.FA_HUO.name());
                order.setSendTime(System.currentTimeMillis());
                orderRepository.update(order);
            }
        }else{
            throw new ServiceException("订单类型错误，请联系管理员");
        }

    }
}
