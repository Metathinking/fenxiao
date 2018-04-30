package com.hu.fenxiao.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Controller
public class LocationController {


    @RequestMapping(value = "location", method = RequestMethod.GET)
    @ResponseBody
    public String location(HttpServletRequest request) {
        String descPathString = request.getSession().getServletContext().getRealPath("/");
        StringBuilder stringBuilder = new StringBuilder();
        Enumeration<String> attributeNames = request.getSession().getServletContext().getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String s = attributeNames.nextElement();
            Object attribute = request.getSession().getAttribute(s);
            stringBuilder.append("name:").append(s).append("==========key:").append(attribute).append("\n");
        }
//        for (String name:request.getSession().getAttributeNames())

        return this.getClass().getResource("/").toString();
    }
}
