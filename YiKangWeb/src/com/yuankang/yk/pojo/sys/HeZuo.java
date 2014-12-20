package com.yuankang.yk.pojo.sys;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class HeZuo implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private String url;
	private String lastUpdateUser;
	private Date lastUpdateTime;
	public String getLastUpdateUser() {
		return lastUpdateUser;
	}
	public void setLastUpdateUser(String lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	

	

}