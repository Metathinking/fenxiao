package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Manufacturer;
import com.hu.fenxiao.repository.ManufacturerRepository;
import com.hu.fenxiao.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManufacturerServiceImpl implements ManufacturerService {

    @Autowired
    private ManufacturerRepository manufacturerRepository;

    private final int ID = 10001;

    @Override
    public void edit(Manufacturer manufacturer) {
        Manufacturer db = manufacturerRepository.findById(ID);
        if (db == null) {
            manufacturer.setId(ID);
            manufacturerRepository.create(manufacturer);
        } else {
            manufacturer.setId(ID);
            manufacturerRepository.update(manufacturer);
        }
    }

    @Override
    public Manufacturer find() {
        return manufacturerRepository.findById(ID);
    }
}
