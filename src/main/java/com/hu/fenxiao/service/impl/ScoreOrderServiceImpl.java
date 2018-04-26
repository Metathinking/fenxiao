package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.*;
import com.hu.fenxiao.domain.vo.ScoreOrderVO;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.*;
import com.hu.fenxiao.service.ScoreOrderService;
import com.hu.fenxiao.type.OrderType;
import com.hu.fenxiao.type.ScoreChangeReason;
import com.hu.fenxiao.type.ScoreOrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ScoreOrderServiceImpl implements ScoreOrderService {

    @Autowired
    private ScoreOrderRepository scoreOrderRepository;

    @Autowired
    private ScoreOrderItemRepository scoreOrderItemRepository;

    @Autowired
    private MemberAccountRepository memberAccountRepository;

    @Autowired
    private SendRecordRepository sendRecordRepository;

    @Autowired
    private ScoreRecordRepository scoreRecordRepository;

    @Override
    public ScoreOrderVO create(ScoreOrderVO scoreOrderVO, Member member) {
        int maxId = scoreOrderRepository.getMaxId();
        maxId++;
        ScoreOrder scoreOrder = scoreOrderVO.getScoreOrder();
        scoreOrder.setMemberOpenid(member.getOpenid());
        scoreOrder.setId(maxId);
        scoreOrder.setOrderTime(System.currentTimeMillis());
        scoreOrder.setStatus(ScoreOrderStatus.XIA_DAN.name());

        ScoreOrderItem scoreOrderItem = scoreOrderVO.getScoreOrderItem();
        if (scoreOrderItem == null || scoreOrderItem.getQuantity() == 0) {
            throw new ServiceException(200, "请选择商品");
        }
        int itemMaxId = scoreOrderItemRepository.getMaxId();
        int grandTotal = scoreOrderItem.getScore() * scoreOrderItem.getQuantity();

        MemberAccount account = memberAccountRepository.findById(member.getId());
        if (account.getScore() < grandTotal) {
            throw new ServiceException(201, "积分不足");
        }
        int before = account.getScore();
        account.setScore(before - grandTotal);
        memberAccountRepository.update(account);

        addScoreRecord(member, scoreOrder, account, before);

        itemMaxId++;
        scoreOrderItem.setId(itemMaxId);
        scoreOrderItem.setOrderId(scoreOrder.getId());

        scoreOrder.setGrandTotal(grandTotal);
        scoreOrderRepository.create(scoreOrder);
        scoreOrderItemRepository.create(scoreOrderItem);
        return scoreOrderVO;
    }

    /**
     * 添加积分变动记录
     *
     * @param member
     * @param scoreOrder
     * @param account
     * @param before
     */
    private void addScoreRecord(Member member, ScoreOrder scoreOrder, MemberAccount account, int before) {
        ScoreRecord scoreRecord = new ScoreRecord();
        int scoreRecordRepositoryMaxId = scoreRecordRepository.getMaxId();
        scoreRecordRepositoryMaxId++;
        scoreRecord.setId(scoreRecordRepositoryMaxId);
        scoreRecord.setMemberId(member.getId());
        scoreRecord.setOrderId(scoreOrder.getId());
        scoreRecord.setBefore(before);
        scoreRecord.setScore(scoreOrder.getGrandTotal());
        scoreRecord.setAfter(account.getScore());
        scoreRecord.setReason(ScoreChangeReason.JI_FEN_DUI_HUAN.name());
        scoreRecord.setTime(System.currentTimeMillis());
        scoreRecord.setStatus("");
        scoreRecordRepository.create(scoreRecord);
    }

    @Override
    public void update(ScoreOrder order) {
        scoreOrderRepository.update(order);
    }

    @Override
    public List<ScoreOrderVO> list(Map<String, Object> params) {
        List<ScoreOrder> orderList = scoreOrderRepository.list(params);
        List<ScoreOrderVO> voList = new ArrayList<>();
        for (ScoreOrder scoreOrder : orderList) {
            ScoreOrderItem item = scoreOrderItemRepository.findByOrderId(scoreOrder.getId() + "");
            ScoreOrderVO scoreOrderVO = new ScoreOrderVO();
            scoreOrderVO.setScoreOrder(scoreOrder);
            scoreOrderVO.setScoreOrderItem(item);
            voList.add(scoreOrderVO);
        }
        return voList;
    }

    @Override
    public ScoreOrderVO findById(String id) {
        ScoreOrder order = scoreOrderRepository.findById(id);
        ScoreOrderItem item = scoreOrderItemRepository.findByOrderId(order.getId() + "");
        ScoreOrderVO scoreOrderVO = new ScoreOrderVO();
        scoreOrderVO.setScoreOrder(order);
        scoreOrderVO.setScoreOrderItem(item);
        return scoreOrderVO;
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return scoreOrderRepository.getCount(params);
    }



    @Override
    public void shouHuo(String orderId) {
        ScoreOrder db = scoreOrderRepository.findById(orderId);
        if (ScoreOrderStatus.FA_HUO.name().equals(db.getStatus())) {
            db.setStatus(ScoreOrderStatus.WAN_CHENG.name());
            scoreOrderRepository.update(db);
        }
    }
}
