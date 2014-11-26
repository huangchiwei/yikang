package com.yuankang.yk.pojo.advert;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.ForeignKey;

import com.yuankang.yk.pojo.sys.User;

/**
 * 广告
 * wei
 */
@Entity
@Table(name = "advert", catalog = "yikang")
public class Advert implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", unique = true, nullable = false)
	private Long id;
	@Column(name = "AdName")
	private String adName;
	/** 广告位置*/
	@Column(name = "AdPositionId")
	private Long adPositionId;
	@Column(name = "Url", length = 500)
	private String url;
	@Column(name = "Img")
	private String img;
	@Column(name = "IsShow")
	private Integer isShow;
	@Column(name = "LastUpdateUser")
	private String lastUpdateUser;
	@Column(name = "lastUpdateTime")
	@Temporal(TemporalType.DATE)
	private Date lastUpdateTime;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}



	public Long getAdPositionId() {
		return adPositionId;
	}

	public void setAdPositionId(Long adPositionId) {
		this.adPositionId = adPositionId;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getIsShow() {
		return this.isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
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

	

}