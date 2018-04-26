package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.YongJinSetting;
import com.hu.fenxiao.repository.YongJinSettingRepository;
import com.hu.fenxiao.service.YongJinSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YongJinSettingServiceImpl implements YongJinSettingService {

    @Autowired
    private YongJinSettingRepository yongJinSettingRepository;

    public static final int ID = 10001;

    @Override
    public YongJinSetting edit(YongJinSetting yongJinSetting) {
        YongJinSetting db = yongJinSettingRepository.findById(ID);
        yongJinSetting.setId(ID);
        if (db == null) {
            yongJinSettingRepository.create(yongJinSetting);
        } else {
            yongJinSettingRepository.update(yongJinSetting);
        }
        return yongJinSetting;
    }

    @Override
    public YongJinSetting find() {
        return yongJinSettingRepository.findById(ID);
    }
}
