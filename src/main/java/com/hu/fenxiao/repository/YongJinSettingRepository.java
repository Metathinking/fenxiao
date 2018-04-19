package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.YongJinSetting;
import org.springframework.stereotype.Repository;

@Repository
public interface YongJinSettingRepository {

    void create(YongJinSetting yongJinSetting);

    void update(YongJinSetting yongJinSetting);

    YongJinSetting findById(int id);

    int getCount();
}
