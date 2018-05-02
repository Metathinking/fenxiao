package com.hu.fenxiao.util;

import java.math.BigDecimal;
import java.math.RoundingMode;

public class NumberUtil {

    public static double format(double number) {
        BigDecimal bigDecimal = new BigDecimal(number);
        BigDecimal scale = bigDecimal.setScale(2, RoundingMode.HALF_EVEN);
        return scale.doubleValue();
    }
}
