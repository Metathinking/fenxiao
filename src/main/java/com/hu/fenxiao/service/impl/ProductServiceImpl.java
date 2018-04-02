package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.repository.ProductRepository;
import com.hu.fenxiao.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductRepository productRepository;

    public void create(Product product) {
        int maxId = productRepository.getMaxId();
        maxId++;
        product.setId(maxId);
        productRepository.create(product);
    }

    public void update(Product product) {
        productRepository.update(product);
    }

    public void delete(String id) {
        productRepository.delete(id);
    }

    public List<Product> list() {
        return productRepository.list();
    }

    public Product findById(String id) {
        return productRepository.findById(id);
    }
}
