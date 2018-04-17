package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.*;
import com.hu.fenxiao.domain.vo.OrderVO;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.*;
import com.hu.fenxiao.service.OrderService;
import com.hu.fenxiao.type.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;


    /**
     * 订单确认
     *
     * @return
     */
    public OrderVO affirm(String memberId, List<String> ids) {
//        memberService.findByOpenId("16");//todo
        Member member = new Member();
        member.setName("李四");
        member.setPhone("13344445555");
        member.setAddress("山东滨州");

        Order order = new Order();
        order.setMemberOpenid(member.getOpenid());
        order.setMemberName(member.getName());
        order.setPhone(member.getPhone());
        order.setAddress(member.getAddress());

        List<OrderItem> orderItemList = new ArrayList<OrderItem>();
        double total = 0;
        for (String id : ids) {
            OrderItem orderItem = new OrderItem();
            CartItem cartItem = cartItemRepository.findById(id);
            if (cartItem == null) {
                continue;
            }
            Product product = productRepository.findById(cartItem.getProductId() + "");
            if (product == null) {
                continue;
            }
            orderItem.setProductId(product.getId());
            orderItem.setName(product.getName());
            orderItem.setXiangXing(product.getXiangXing());
            orderItem.setRongLiang(product.getRongLiang());
            orderItem.setDuShu(product.getDuShu());
            orderItem.setPrice(product.getPrice());
            orderItem.setImage(product.getImage());
            orderItem.setIntroduction(product.getIntroduction());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setTotalPrice(orderItem.getQuantity() * orderItem.getPrice());
            orderItemList.add(orderItem);
            total += orderItem.getTotalPrice();
        }
        order.setGrandTotal(total);
        OrderVO orderVO = new OrderVO();
        orderVO.setOrder(order);
        orderVO.setItemList(orderItemList);
        return orderVO;
    }

    /**
     * 1.订单记录
     * 2.积分记录
     * 3.提成记录
     * @param orderVO
     */
    @Override
    public void create(OrderVO orderVO) {
        int maxId = orderRepository.getMaxId();
        maxId++;
        Order order = orderVO.getOrder();
        order.setId(maxId);
        order.setOrderTime(System.currentTimeMillis());
        order.setStatus(OrderStatus.NO_PAY.name());

        List<OrderItem> itemList = orderVO.getItemList();
        if (itemList==null||itemList.isEmpty()){
            throw new ServiceException(200,"请选择商品");
        }
        int itemMaxId = orderItemRepository.getMaxId();
        double grandTotal=0;
        for (OrderItem orderItem:itemList){
            itemMaxId++;
            orderItem.setId(itemMaxId);
            orderItem.setOrderId(order.getId());
            grandTotal+=orderItem.getPrice()*orderItem.getQuantity();
        }
        order.setGrandTotal(grandTotal);
        orderRepository.create(order);
        orderItemRepository.create(itemList);

//        private long payTime;//付款时间
//        private long sendTime;//发货时间
    }

    @Override
    public void update(Order order) {
        Order db = orderRepository.findById(String.valueOf(order.getId()));

        //todo

        orderRepository.update(db);
    }

    @Override
    public List<Order> list(Map<String, Object> params) {
        return orderRepository.list(params);
    }

    @Override
    public Order findById(String id) {
        return orderRepository.findById(id);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return orderRepository.getCount(params);
    }
}
