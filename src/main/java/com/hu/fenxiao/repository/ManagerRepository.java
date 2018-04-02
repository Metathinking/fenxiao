package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.Manager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerRepository {

    void create(Manager manager);

    void update(@Param("name") String name,@Param("password") String password);

    int getMaxId();

    int getCount();

    Manager find(@Param("name") String name,@Param("password") String password);
}
