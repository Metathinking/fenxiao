package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.CartItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository {

    void create(CartItem cartItem);

    void update(CartItem cartItem);

    List<CartItem> list(int cartId);

    CartItem findById(String id);

    int getMaxId();

    void delete(String id);

    CartItem findByCartIdAndProductId(@Param("cartId") int cartId,@Param("productId") String productId);
}
