package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.ScoreProduct;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScoreProductRepository {

    void create(ScoreProduct scoreProduct);

    void update(ScoreProduct scoreProduct);

    void delete(String id);

    List<ScoreProduct> list();

    int getMaxId();

    ScoreProduct findById(String id);
}
