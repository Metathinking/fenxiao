package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.HomeImage;
import com.hu.fenxiao.repository.HomeImageRepository;
import com.hu.fenxiao.service.HomeImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeImageServiceImpl implements HomeImageService {

    @Autowired
    private HomeImageRepository homeImageRepository;

    @Override
    public void create( HomeImage homeImage) {
        int maxId = homeImageRepository.getMaxId();
        maxId++;
        homeImage.setId(maxId);
        homeImageRepository.create(homeImage);
    }

    @Override
    public List<HomeImage> list() {
        return homeImageRepository.list();
    }

    @Override
    public void delete(String id) {
        homeImageRepository.delete(id);
    }
}
