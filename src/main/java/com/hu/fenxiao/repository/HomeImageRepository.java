package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.HomeImage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HomeImageRepository {

    void create(HomeImage homeImage);

    void update(HomeImage homeImage);

    void delete(String id);

    List<HomeImage> list();

    HomeImage findById(String id);

    int getCount();

    int getMaxId();
}
