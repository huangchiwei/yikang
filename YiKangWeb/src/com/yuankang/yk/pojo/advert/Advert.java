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
	private String name;
	/** 广告位置*/
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = AdPosition.class, cascade = {CascadeType.REFRESH})
	@JoinColumn(name = "AdPositionId", referencedColumnName = "id")
	@ForeignKey(name = "FK_ADVERT_ADPOSITIONID")
	private AdPosition adPosition;
	@Column(name = "Url", length = 500)
	private String url;
	@Column(name = "Img")
	private String img;
	@Column(name = "IsShow")
	private Integer isShow;
	@Column(name = "OrderNo")
	private Integer orderNo;
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Creater", nullable = true, referencedColumnName = "ID")
	@ForeignKey(name = "FK_ADVERT_CREATER")
	private User creater;
	@Column(name = "CreatDate")
	@Temporal(TemporalType.DATE)
	private Date creatDate;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public AdPosition getAdPosition() {
		return this.adPosition;
	}

	public void setAdPosition(AdPosition adPosition) {
		this.adPosition = adPosition;
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

	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	
	public User getCreater() {
		return this.creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
	}

	public Date getCreatDate() {
		return this.creatDate;
	}

	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}

}