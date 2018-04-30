package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.TiXianRecord;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.TiXianRecordService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/ti_xian")
public class AdminTiXianController {

    private Logger logger = LogManager.getLogger(AdminTiXianController.class);

    @Autowired
    private TiXianRecordService tiXianRecordService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String gotoList(@RequestParam(required = false) Integer index,
                           @RequestParam(required = false) String status,
                           @RequestParam(required = false) String search,
                           Model model) {
        try {
            if (index == null) {
                index = 1;
            }
            PageQuery query = new PageQuery();
            query.setIndex(index);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", query.getStart());
            map.put("size", query.getSize());
            if (!StringUtils.isEmpty(status)) {
                map.put("status", status);
                model.addAttribute("status", status);
            }
            if (!StringUtils.isEmpty(search)) {
                map.put("search", search);
                model.addAttribute("search", search);
            }
            List<TiXianRecord> list = tiXianRecordService.list(map);
            int count = tiXianRecordService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("",e);
        }
        return "admin/ti_xian_list";
    }

    @RequestMapping(value = "shenHe", method = RequestMethod.POST)
    @ResponseBody
    public Tip shenHe(@RequestBody TiXianRecord tiXianRecord) {
        try {
            tiXianRecordService.shenHe(tiXianRecord);
            return new Tip(true, 100, "完成");
        } catch (Exception e) {
            logger.error("",e);
            return ExceptionTipHandler.handler(e);
        }

    }
}
