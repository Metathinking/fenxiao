package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.ScoreProduct;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ScoreProductRepository {

    void create(ScoreProduct scoreProduct);

    void update(ScoreProduct scoreProduct);

    void delete(String id);

    List<ScoreProduct> list(Map<String,Object> params);

    int getCount(Map<String,Object> params);

    int getMaxId();

    ScoreProduct findById(String id);
}
