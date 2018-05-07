package com.hu.fenxiao.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;

/**
 * 二维码生成
 *
 * @author 胡玉波
 * @version 1.0
 * @(#) CodeImageUtil.java 2016/09/20 08:41
 */
public class CodeImageUtil {

    private static final int width = 120;
    private static final int height = 120;

    public static String createQRCodeImage(int memberId, String url, HttpServletRequest request) throws WriterException, IOException {
        String format = "png";
        String direction = "/codeImage";
        ServletContext servletContext = request.getServletContext();
        String realDirection = servletContext.getRealPath(direction);
        File descPath = new File(realDirection);
        if (!descPath.exists()) {
            descPath.mkdirs();
        }
        String path = realDirection + File.separator + memberId + "." + format;

        String serverUrl = direction + "/" + memberId + "." + format;

        //如果文件已存在，直接返回
        File file = new File(path);
        if (file.exists()) {
            return serverUrl;
        }

        Hashtable hints = new Hashtable();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        BitMatrix bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);
        OutputStream os = new FileOutputStream(path);
        MatrixToImageWriter.writeToStream(bitMatrix, format, os);// 输出图像

        return serverUrl;
    }
}