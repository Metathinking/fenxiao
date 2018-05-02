package com.hu.fenxiao.wxpay;

//import com.hu.fenxiao.wxpay.sdk.IWXPayDomain;
//import com.hu.fenxiao.wxpay.sdk.WXPayConfig;

import com.github.wxpay.sdk.WXPayConfig;

import java.io.*;

public class WXPayConfigImpl implements WXPayConfig {

    private final String APP_ID = "wx0b80f1b0a4c1602f";
    private final String MCH_ID = "1502480891";
//    private final String KEY = "CrCb0QVjATcgx84vgJb9sAo7UcRyO7kCLGKRU9C1Wm9";
//    private final String KEY = "44e368e1847de6a9b616fe1ffb92b8e4";//秘钥
    private final String KEY = "8b5d8420c65641efa831b3e77d7d648d";//秘钥
    private byte[] certData;

    private static WXPayConfigImpl wxPayConfigImpl;

    private WXPayConfigImpl() throws IOException {
        String path = this.getClass().getResource("/").toString();
        path = path.substring(path.indexOf(":") + 2);
        String certPath = path + "apiclient_cert.p12";
        File file = new File(certPath);
        InputStream certStream = new FileInputStream(file);
        this.certData = new byte[(int) file.length()];
        certStream.read(this.certData);
        certStream.close();
    }

    public static WXPayConfigImpl getInstance() throws IOException {
        if (wxPayConfigImpl == null) {
            synchronized (WXPayConfigImpl.class) {
                if (wxPayConfigImpl == null) {
                    wxPayConfigImpl = new WXPayConfigImpl();
                }
            }

        }
        return wxPayConfigImpl;
    }


    @Override
    public String getAppID() {
        return APP_ID;
    }

    @Override
    public String getMchID() {
        return MCH_ID;
    }

    @Override
    public String getKey() {
        return KEY;
    }

    @Override
    public InputStream getCertStream() {
        ByteArrayInputStream certBis;
        certBis = new ByteArrayInputStream(this.certData);
        return certBis;
    }

    @Override
    public int getHttpConnectTimeoutMs() {
        return 2000;
    }

    @Override
    public int getHttpReadTimeoutMs() {
        return 10000;
    }

}
