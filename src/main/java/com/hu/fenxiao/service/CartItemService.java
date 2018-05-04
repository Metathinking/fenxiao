package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.CartItem;

import java.util.List;

public interface CartItemService {

    void edit(int memberId,String productId,int quantity);

    void update(CartItem cartItem);

    List<CartItem> list(int id);

    CartItem findById(String id);

    void delete(String id);

    int reduce(int memberId,String productId);

    int raise(int memberId,String productId);
}
