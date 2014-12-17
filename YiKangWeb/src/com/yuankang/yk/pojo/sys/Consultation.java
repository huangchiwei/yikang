package com.yuankang.yk.pojo.sys;

import java.util.Date;

public class Consultation {
private Long id;
private String creater;
private String answerUser;
private Date createTime;
private String askCotent;
private String answerContent;
private Date answerTime;
private Integer status;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getCreater() {
	return creater;
}
public void setCreater(String creater) {
	this.creater = creater;
}
public Date getCreateTime() {
	return createTime;
}
public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}
public String getAskCotent() {
	return askCotent;
}
public void setAskCotent(String askCotent) {
	this.askCotent = askCotent;
}
public String getAnswerContent() {
	return answerContent;
}
public void setAnswerContent(String answerContent) {
	this.answerContent = answerContent;
}
public Date getAnswerTime() {
	return answerTime;
}
public void setAnswerTime(Date answerTime) {
	this.answerTime = answerTime;
}
public Integer getStatus() {
	return status;
}
public void setStatus(Integer status) {
	this.status = status;
}
public String getAnswerUser() {
	return answerUser;
}
public void setAnswerUser(String answerUser) {
	this.answerUser = answerUser;
}

}
