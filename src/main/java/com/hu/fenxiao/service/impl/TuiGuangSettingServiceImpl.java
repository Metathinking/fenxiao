package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.TuiGuangSetting;
import com.hu.fenxiao.repository.TuiGuangSettingRepository;
import com.hu.fenxiao.service.TuiGuangSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TuiGuangSettingServiceImpl implements TuiGuangSettingService {

    @Autowired
    private TuiGuangSettingRepository tuiGuangSettingRepository;

    public static final int ID = 10001;

    @Override
    public TuiGuangSetting edit(TuiGuangSetting tuiGuangSetting) {
        TuiGuangSetting db = tuiGuangSettingRepository.findById(ID);
        tuiGuangSetting.setId(ID);
        if (db == null) {
            tuiGuangSettingRepository.create(tuiGuangSetting);
        } else {
            tuiGuangSettingRepository.update(tuiGuangSetting);
        }
        return tuiGuangSetting;
    }

    @Override
    public TuiGuangSetting find() {
        return tuiGuangSettingRepository.findById(ID);
    }
}
