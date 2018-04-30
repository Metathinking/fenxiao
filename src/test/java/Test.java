import com.hu.fenxiao.wxpay.WXPayConfigImpl;

import java.io.IOException;

public class Test {

    public static void main(String[] args) {
        try {
            WXPayConfigImpl instance = WXPayConfigImpl.getInstance();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
