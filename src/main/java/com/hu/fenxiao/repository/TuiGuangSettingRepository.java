package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.TuiGuangSetting;
import org.springframework.stereotype.Repository;

@Repository
public interface TuiGuangSettingRepository {

    void create(TuiGuangSetting tuiGuangSetting);

    void update(TuiGuangSetting tuiGuangSetting);

    TuiGuangSetting findById(int id);

    int getCount();
}
