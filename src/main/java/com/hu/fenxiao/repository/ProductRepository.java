package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.Product;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ProductRepository {


    void create(Product product);

    void update(Product product);

    void delete(String id);

    List<Product> list(Map<String, Object> params);

    int getCount(Map<String, Object> params);

    int getMaxId();

    Product findById(String id);
}
