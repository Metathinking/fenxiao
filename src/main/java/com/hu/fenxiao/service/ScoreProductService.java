package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.ScoreProduct;

import java.util.List;

public interface ScoreProductService {

    void create(ScoreProduct scoreProduct);

    void update(ScoreProduct scoreProduct);

    void delete(String id);

    List<ScoreProduct> list();

    ScoreProduct findById(String id);
}
