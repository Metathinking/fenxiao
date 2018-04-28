package com.hu.fenxiao.util;

import com.hu.fenxiao.query.PageQuery;
import com.hu.fenxiao.type.OrderStatus;
import com.hu.fenxiao.type.ScoreChangeReason;
import com.hu.fenxiao.type.ScoreOrderStatus;
import com.hu.fenxiao.type.TiXianStatus;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class TagUtil {

    /**
     * 时间格式化
     *
     * @param time
     * @param format
     * @return
     */
    public static String format(long time, String format) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        if (time == Long.MIN_VALUE || time == 0 || time == -1) {
            return "";
        }
        if (time == 100) {
            return simpleDateFormat.format(new Date());
        }
        return simpleDateFormat.format(new Date(time));
    }

    /**
     * 获取订单状态信息的描述（description）
     *
     * @param name
     * @return
     */
    public static String getOrderDescription(String name) {
        OrderStatus status = OrderStatus.valueOf(name);
        return status.getDescription();
    }

    /**
     * 获取积分订单状态信息的描述（description）
     *
     * @param name
     * @return
     */
    public static String getScoreOrderStatus(String name) {
        ScoreOrderStatus status = ScoreOrderStatus.valueOf(name);
        return status.getDescription();
    }

    /**
     * 分页
     *
     * @param query
     * @return
     */
    public static List<Integer> getPageIndex(PageQuery query) {
        List<Integer> list = new ArrayList<Integer>();
        int start = query.getStartPage();
        int endPage = query.getEndPage();
        for (int i = start; i <= endPage; i++) {
            list.add(i);
        }
        return list;
    }

    /**
     * 获取提现申请（description）
     *
     * @param name
     * @return
     */
    public static String getTiXianStatus(String name) {
        TiXianStatus status = TiXianStatus.valueOf(name);
        return status.getDescription();
    }

    /**
     * 获取积分变动原因（description）
     *
     * @param name
     * @return
     */
    public static String getScoreChangeReason(String name) {
        ScoreChangeReason status = ScoreChangeReason.valueOf(name);
        return status.getDescription();
    }
}
