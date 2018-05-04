package com.hu.fenxiao.controller.admin;

import com.hu.fenxiao.domain.Notice;
import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.service.NoticeService;
import com.hu.fenxiao.util.ExceptionTipHandler;
import com.hu.fenxiao.util.Tip;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/notice")
public class AdminNoticeController {

    @Autowired
    private NoticeService noticeService;

    private Logger logger = LogManager.getLogger(AdminNoticeController.class);


    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String gotoList(@RequestParam(required = false) Integer index,
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
            List<Notice> list = noticeService.list(map);
            int count = noticeService.getCount(map);
            query.setCount(count);
            model.addAttribute("list", list);
            model.addAttribute("pageQuery", query);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return "admin/notice_list";
    }


    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String add(String content) {
        try {
            noticeService.create(content);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return "redirect:/admin/notice/list";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Tip add(@RequestBody Notice notice) {
        try {
            noticeService.update(notice);
            return new Tip(true, 100, "保存成功");
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return ExceptionTipHandler.handler(e);
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam String id) {
        try {
            noticeService.delete(id);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return "redirect:/admin/notice/list";
    }

    /**
     * 设置为最新
     * @param id
     * @return
     */
    @RequestMapping(value = "updateToNew", method = RequestMethod.GET)
    public String updateToNew(@RequestParam String id) {
        try {
            noticeService.updateToNew(id);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return "redirect:/admin/notice/list";
    }

}
