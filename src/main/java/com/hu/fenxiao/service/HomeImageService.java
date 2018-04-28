package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.HomeImage;

import java.util.List;

public interface HomeImageService {

    void create( HomeImage homeImage);

    List<HomeImage> list();

    void delete(String id);
}
