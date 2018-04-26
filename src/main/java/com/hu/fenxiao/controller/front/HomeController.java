package com.hu.fenxiao.controller.front;

import com.hu.fenxiao.domain.Member;
import com.hu.fenxiao.domain.Product;
import com.hu.fenxiao.domain.WeiXinToken;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.MemberService;
import com.hu.fenxiao.service.ProductService;
import com.hu.fenxiao.util.WXLoginUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class HomeController {

    private Logger logger = LogManager.getLogger(HomeController.class);

    @Autowired
    private ProductService productService;

    /**
     * 进入首页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = {"", "home", "index"}, method = RequestMethod.GET)
    public String home(@RequestParam(required = false) Integer index,Model model) {
        try {
            if (index == null) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            List<Product> list = productService.list(map);
            int count = productService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
//            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
        }
        return "front/index";
    }



}
