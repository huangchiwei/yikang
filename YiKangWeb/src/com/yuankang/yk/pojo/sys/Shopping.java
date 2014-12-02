package com.yuankang.yk.pojo.sys;

import java.util.Date;

public class Shopping {
private long id;
private int price;
private String url;
private String picPath;
private String discription;
private int orderNo;
private Date lastUpdateTime;
private String lastUpdateUser;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getPicPath() {
	return picPath;
}
public void setPicPath(String picPath) {
	this.picPath = picPath;
}
public String getDiscription() {
	return discription;
}
public void setDiscription(String discription) {
	this.discription = discription;
}
public int getOrderNo() {
	return orderNo;
}
public void setOrderNo(int orderNo) {
	this.orderNo = orderNo;
}
public Date getLastUpdateTime() {
	return lastUpdateTime;
}
public void setLastUpdateTime(Date lastUpdateTime) {
	this.lastUpdateTime = lastUpdateTime;
}
public String getLastUpdateUser() {
	return lastUpdateUser;
}
public void setLastUpdateUser(String lastUpdateUser) {
	this.lastUpdateUser = lastUpdateUser;
}

}
