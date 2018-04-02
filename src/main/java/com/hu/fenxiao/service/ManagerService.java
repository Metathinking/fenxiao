package com.hu.fenxiao.service;

import com.hu.fenxiao.domain.Manager;

public interface ManagerService {

    Manager login(String name, String password);

    void changePassword(String name, String password);
}
