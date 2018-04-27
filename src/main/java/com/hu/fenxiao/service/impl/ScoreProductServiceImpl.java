package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.ScoreProduct;
import com.hu.fenxiao.repository.ScoreProductRepository;
import com.hu.fenxiao.service.ScoreProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScoreProductServiceImpl implements ScoreProductService {

    @Autowired
    private ScoreProductRepository scoreProductRepository;


    @Override
    public void create(ScoreProduct scoreProduct) {
        int maxId = scoreProductRepository.getMaxId();
        maxId++;
        scoreProduct.setId(maxId);
        scoreProductRepository.create(scoreProduct);
    }

    @Override
    public void update(ScoreProduct scoreProduct) {
        scoreProductRepository.update(scoreProduct);
    }

    @Override
    public void delete(String id) {
        scoreProductRepository.delete(id);
    }

    @Override
    public List<ScoreProduct> list(Map<String,Object> params) {
        return scoreProductRepository.list(params);
    }

    @Override
    public int getCount(Map<String, Object> params) {
        return scoreProductRepository.getCount(params);
    }

    @Override
    public ScoreProduct findById(String id) {
        return scoreProductRepository.findById(id);
    }
}
