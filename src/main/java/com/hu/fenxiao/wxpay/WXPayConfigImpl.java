package com.hu.fenxiao.wxpay;

//import com.hu.fenxiao.wxpay.sdk.IWXPayDomain;
//import com.hu.fenxiao.wxpay.sdk.WXPayConfig;

import com.github.wxpay.sdk.WXPayConfig;

import java.io.*;

public class WXPayConfigImpl implements WXPayConfig {

    private final String APP_ID = "";
    private final String MCH_ID = "";
    private final String KEY = "";
    private byte[] certData;

    private static WXPayConfigImpl wxPayConfigImpl;

    private WXPayConfigImpl() throws IOException {
        String certPath = "classpath:/apiclient_cert.p12";//todo
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
        return null;
    }

    @Override
    public int getHttpConnectTimeoutMs() {
        return 0;
    }

    @Override
    public int getHttpReadTimeoutMs() {
        return 0;
    }

}
//public class WXPayConfigImpl{
//
//}