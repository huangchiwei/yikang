package com.yuankang.yk.pojo.sys;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

public class ZhaoPing implements java.io.Serializable {

	// Fields

	private Long id;
	private String title;
	private String content;
	private String lastUpdateUser;
	private Date lastUpdateTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	

}