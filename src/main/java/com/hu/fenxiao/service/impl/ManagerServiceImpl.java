package com.hu.fenxiao.service.impl;

import com.hu.fenxiao.domain.Manager;
import com.hu.fenxiao.exception.ServiceException;
import com.hu.fenxiao.repository.ManagerRepository;
import com.hu.fenxiao.service.ManagerService;
import com.hu.fenxiao.util.Md5Factory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerRepository managerRepository;

    private final String DEFAULT_NAME = "admin";
    private final String DEFAULT_PASSWORD = "admin";

    @Override
    public Manager login(String name, String password) {
        int count = managerRepository.getCount();
        if (count == 0) {
            Manager manager = new Manager();
            int maxId = managerRepository.getMaxId();
            manager.setId(maxId);
            manager.setName(DEFAULT_NAME);
            manager.setPassword(Md5Factory.encoding(DEFAULT_PASSWORD));
            managerRepository.create(manager);
            if (DEFAULT_NAME.equals(name) &&
                    Md5Factory.encoding(DEFAULT_PASSWORD).equals(Md5Factory.encoding(password))) {
                return manager;
            }
            return null;
        }
        Manager manager = managerRepository.find(name, password);
        return manager;
    }

    @Override
    public void changePassword(String name, String password) {
        managerRepository.update(name, password);
    }

    @Override
    public void reset(String username, String password) {
        if (!DEFAULT_NAME.equals(username)) {
            throw new ServiceException("初始用户名错误");
        }
        if (!DEFAULT_PASSWORD.equals(password)) {
            throw new ServiceException("初始密码错误");
        }
        int count = managerRepository.getCount();
        if (count == 0) {
            Manager manager = new Manager();
            int maxId = managerRepository.getMaxId();
            manager.setId(maxId);
            manager.setName(DEFAULT_NAME);
            manager.setPassword(Md5Factory.encoding(DEFAULT_PASSWORD));
            managerRepository.create(manager);
        } else {
            managerRepository.update(DEFAULT_NAME, Md5Factory.encoding(DEFAULT_PASSWORD));
        }
    }
}
