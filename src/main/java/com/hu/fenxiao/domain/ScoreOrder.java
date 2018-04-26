package com.hu.fenxiao.domain;

/**
 * 订单
 */
public class ScoreOrder {

    private int id;
    private String memberOpenid;//
    private String memberName;
    private String phone;//默认为会员电话，可修改
    private String address;//默认为会员地址，可修改
    private int grandTotal;//总价
    private long orderTime;//下单时间
    private long sendTime;//发货时间
    /**
     * @see com.hu.fenxiao.type.ScoreOrderStatus
     */
    private String status;//状态
    private String remark;//备注信息,可以为null

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMemberOpenid() {
        return memberOpenid;
    }

    public void setMemberOpenid(String memberOpenid) {
        this.memberOpenid = memberOpenid;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }



    public long getOrderTime() {
        return orderTime;
    }

    public int getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(int grandTotal) {
        this.grandTotal = grandTotal;
    }

    public void setOrderTime(long orderTime) {
        this.orderTime = orderTime;
    }

    public long getSendTime() {
        return sendTime;
    }

    public void setSendTime(long sendTime) {
        this.sendTime = sendTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
