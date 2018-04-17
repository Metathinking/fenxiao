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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getXiangXing() {
        return xiangXing;
    }

    public void setXiangXing(String xiangXing) {
        this.xiangXing = xiangXing;
    }

    public String getRongLiang() {
        return rongLiang;
    }

    public void setRongLiang(String rongLiang) {
        this.rongLiang = rongLiang;
    }

    public String getDuShu() {
        return duShu;
    }

    public void setDuShu(String duShu) {
        this.duShu = duShu;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
