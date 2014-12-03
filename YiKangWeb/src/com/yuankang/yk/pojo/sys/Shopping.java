package com.yuankang.yk.pojo.sys;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "shopping", catalog = "yikang")
public class Shopping implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", unique = true, nullable = false)
	private Long id;
	@Column(name = "Price")
	private Float price;
	@Column(name = "Url")
	private String url;
	@Column(name = "PicPath")
	private String picPath;
	@Column(name = "Discription")
	private String discription;
	@Column(name = "OrderNo")
	private Integer orderNo;
	@Column(name = "LastUpdateTime")
	private Date lastUpdateTime;
	@Column(name = "LastUpdateUser")
	private String lastUpdateUser;
public Shopping(){
	
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public Float getPrice() {
	return price;
}
public void setPrice(Float price) {
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
public Integer getOrderNo() {
	return orderNo;
}
public void setOrderNo(Integer orderNo) {
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
public static long getSerialversionuid() {
	return serialVersionUID;
}
public Shopping(Long id, Float price, String url, String picPath,
		String discription, Integer orderNo, Date lastUpdateTime,
		String lastUpdateUser) {
	super();
	this.id = id;
	this.price = price;
	this.url = url;
	this.picPath = picPath;
	this.discription = discription;
	this.orderNo = orderNo;
	this.lastUpdateTime = lastUpdateTime;
	this.lastUpdateUser = lastUpdateUser;
}

}
