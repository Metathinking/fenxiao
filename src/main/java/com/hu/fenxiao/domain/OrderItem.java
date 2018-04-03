package com.hu.fenxiao.domain;

public class OrderItem {

    private int id;
    private int orderId;
    /**
     * 商品信息
     */
    private int productId;
    private String name;
    private String xiangXing;//香型
    private String rongLiang;//容量
    private String duShu;//度数
    private double price;//价格
    private String image;//图片
    //    private List<String> imageList;
    private String introduction;//介绍

    private int quantity;
    private double totalPrice;
}
