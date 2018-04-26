package com.hu.fenxiao.service;


import com.hu.fenxiao.domain.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {

    void create(Product product);

    void update(Product product);

    void delete(String id);

    List<Product> list(Map<String, Object> params);

    int getCount(Map<String, Object> params);

    Product findById(String id);
}
