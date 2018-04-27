package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.ScoreProduct;

import java.util.List;
import java.util.Map;

public interface ScoreProductService {

    void create(ScoreProduct scoreProduct);

    void update(ScoreProduct scoreProduct);

    void delete(String id);

    List<ScoreProduct> list(Map<String,Object> params);

    int getCount(Map<String,Object> params);

    ScoreProduct findById(String id);
}
