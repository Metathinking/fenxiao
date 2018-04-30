package com.hu.fenxiao.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConfigListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String root = sce.getServletContext().getRealPath("/");
//        System.
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
