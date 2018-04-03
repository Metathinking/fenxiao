package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.Manufacturer;
import org.springframework.stereotype.Repository;

@Repository
public interface ManufacturerRepository {

    void create(Manufacturer manufacturer);

    void update(Manufacturer manufacturer);

    Manufacturer findById(int id);
}
