package com.yuankang.yk.pojo.sys;
import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * News entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "news", catalog = "yikang")
public class News implements java.io.Serializable {

	// Fields

	private Long id;
	private String categoryId;
	private String title;
	private String content;
	private String digest;
	private String source;
	private String author;
	private Date createTime;
	private Date realTime;
	private Integer orderNo;
	private String status;
	private String createUser;
	private String lastUpdateUser;
	private Date lastUpdateTime;
	private Integer isTop;
	private Integer isRecommend;
	private Integer clicks;
	private Integer hasImage;
	private String coreTip;
	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(String categoryId, String title, String content, String digest,
			String source, String author, Date createTime, Date realTime,
			Integer orderNo, String status, String createUser,
			String lastUpdateUser, Date lastUpdateTime, Integer isTop,
			Integer isRecommend, Integer clicks,Integer hasImage,String coreTip) {
		this.categoryId = categoryId;
		this.title = title;
		this.content = content;
		this.digest = digest;
		this.source = source;
		this.author = author;
		this.createTime = createTime;
		this.realTime = realTime;
		this.orderNo = orderNo;
		this.status = status;
		this.createUser = createUser;
		this.lastUpdateUser = lastUpdateUser;
		this.lastUpdateTime = lastUpdateTime;
		this.isTop = isTop;
		this.isRecommend = isRecommend;
		this.clicks = clicks;
		this.hasImage = hasImage;
		this.coreTip=coreTip;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "CategoryId")
	public String getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "Title", length = 200)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "Content")
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "Digest", length = 65535)
	public String getDigest() {
		return this.digest;
	}

	public void setDigest(String digest) {
		this.digest = digest;
	}

	@Column(name = "Source")
	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Column(name = "Author", length = 50)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "CreateTime", length = 20)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "RealTime", length = 20)
	public Date getRealTime() {
		return this.realTime;
	}

	public void setRealTime(Date realTime) {
		this.realTime = realTime;
	}

	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Column(name = "Status", length = 4)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "CreateUser", length = 100)
	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	@Column(name = "LastUpdateUser", length = 100)
	public String getLastUpdateUser() {
		return this.lastUpdateUser;
	}

	public void setLastUpdateUser(String lastUpdateUser) {
		this.lastUpdateUser = lastUpdateUser;
	}

	@Column(name = "LastUpdateTime", length = 20)
	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@Column(name = "IsTop")
	public Integer getIsTop() {
		return this.isTop;
	}

	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}

	@Column(name = "IsRecommend")
	public Integer getIsRecommend() {
		return this.isRecommend;
	}

	public void setIsRecommend(Integer isRecommend) {
		this.isRecommend = isRecommend;
	}

	@Column(name = "Clicks")
	public Integer getClicks() {
		return this.clicks;
	}

	public void setClicks(Integer clicks) {
		this.clicks = clicks;
	}
	@Column(name = "HasImage")
	public Integer getHasImage() {
		return hasImage;
	}

	public void setHasImage(Integer hasImage) {
		this.hasImage = hasImage;
	}

	@Column(name = "CoreTip")
	public String getCoreTip() {
		return coreTip;
	}

	public void setCoreTip(String coreTip) {
		this.coreTip = coreTip;
	}

}