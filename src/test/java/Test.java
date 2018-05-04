import com.github.wxpay.sdk.WXPayUtil;
import com.hu.fenxiao.util.NumberUtil;
import com.hu.fenxiao.wxpay.WXPayConfigImpl;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

public class Test {

    public static void main(String[] args) {
       double a=1.2365;
        String aStr = String.valueOf(a);
        boolean contains = aStr.contains(".");
        if (contains){
            String substring = aStr.substring(aStr.indexOf(".")+1);
            System.out.println(substring);
        }
    }
}
