package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.CartItem;
import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.repository.CartItemRepository;
import com.hu.fenxiao.repository.ProductRepository;
import com.hu.fenxiao.service.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemRepository cartItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public void edit(int memberId, String productId, int quantity) {
        CartItem cartItem = cartItemRepository.findByCartIdAndProductId(memberId, productId);
        if (cartItem == null) {
            create(memberId, productId,quantity);
        } else {
            quantity = cartItem.getQuantity() + quantity;
            cartItem.setQuantity(quantity);
            cartItem.setTotalPrice(quantity * cartItem.getPrice());
            cartItemRepository.update(cartItem);
        }
    }

    /**
     * 添加新的购物车商品
     *
     * @param userId
     * @param productId
     */
    private void create(int userId, String productId,int quantity) {
        int maxId = cartItemRepository.getMaxId();
        Product product = productRepository.findById(productId);
        maxId++;
        CartItem db = new CartItem();
        db.setId(maxId);
        db.setCartId(userId);
        db.setProductId(product.getId());
        db.setName(product.getName());
        db.setPrice(product.getPrice());
        db.setQuantity(quantity);
        db.setTotalPrice(product.getPrice());
        db.setProductImage(product.getImage());
        cartItemRepository.create(db);
    }

    @Override
    public void update(CartItem cartItem) {
        CartItem db = cartItemRepository.findById(String.valueOf(cartItem.getId()));
        Product product = productRepository.findById(String.valueOf(cartItem.getProductId()));
        db.setName(product.getName());
        db.setPrice(product.getPrice());
        db.setQuantity(cartItem.getQuantity());
        db.setTotalPrice(product.getPrice() * cartItem.getQuantity());
        db.setProductImage(product.getImage());
        cartItemRepository.create(db);
    }

    @Override
    public List<CartItem> list(int cartId) {
        return cartItemRepository.list(cartId);
    }

    @Override
    public CartItem findById(String id) {
        return cartItemRepository.findById(id);
    }

    @Override
    public void delete(String id) {
        cartItemRepository.delete(id);
    }

    @Override
    public int reduce(int memberId, String productId) {
        CartItem cartItem = cartItemRepository.findByCartIdAndProductId(memberId, productId);
        if (cartItem != null) {
            if (cartItem.getQuantity() == 1) {
                return cartItem.getQuantity();
            }
            cartItem.setQuantity(cartItem.getQuantity() - 1);
            cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getPrice());
            cartItemRepository.update(cartItem);
            return cartItem.getQuantity();
        } else {
            create(memberId, productId,1);
            return 1;
        }
    }

    @Override
    public int raise(int memberId, String productId) {
        CartItem cartItem = cartItemRepository.findByCartIdAndProductId(memberId, productId);
        if (cartItem != null) {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getPrice());
            cartItemRepository.update(cartItem);
            return cartItem.getQuantity();
        } else {
            create(memberId, productId,1);
            return 1;
        }
    }
}
