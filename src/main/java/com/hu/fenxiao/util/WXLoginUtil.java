package com.hu.fenxiao.util;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * 微信登录工具
 */
public class WXLoginUtil {

    /**
     * 获取数据
     *
     * @param urlString
     * @param t
     * @param <T>
     * @return
     * @throws IOException
     */
    public static  <T> T getObject(String urlString, Class<T> t) throws IOException {
        URL url = new URL(urlString);
        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
        urlConnection.connect();
        InputStream inputStream = urlConnection.getInputStream();
        byte[] buff = new byte[inputStream.available()];
        inputStream.read(buff);
        String result = new String(buff, "utf-8");
        Gson gson = new Gson();
        T obj = gson.fromJson(result, t);
        inputStream.close();
        urlConnection.disconnect();
        return obj;
    }

    private static final String getportrait ="";//todo

    /**
     *
     * @param portrait
     * @param request
     */
    public static void saveImage(String portrait, HttpServletRequest request) {
        String urlString = getportrait + portrait;
        String basePath = request.getServletContext().getRealPath("/resources");
        String directoryPath = basePath + File.separator + "portrait";
        File directory = new File(directoryPath);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        String fileName = directory + File.separator + portrait;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            URL url = new URL(urlString);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            InputStream inputStream = connection.getInputStream();
            byte[] buff = new byte[1024];
            int cnt;
            while ((cnt = inputStream.read(buff)) > 0) {
                baos.write(buff, 0, cnt);
            }
            inputStream.close();
            connection.disconnect();
            baos.close();
            FileOutputStream fos = new FileOutputStream(fileName);
            fos.write(baos.toByteArray());
            fos.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
