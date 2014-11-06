package com.yuankang.yk.pojo.sys;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Advert entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "advert", catalog = "yikang")
public class Advert implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private Integer adPositionId;
	private String url;
	private String img;
	private Integer isShow;
	private Integer orderNo;
	private String creater;
	private Timestamp creatDate;

	// Constructors

	/** default constructor */
	public Advert() {
	}

	/** full constructor */
	public Advert(String name, Integer adPositionId, String url, String img,
			Integer isShow, Integer orderNo, String creater, Timestamp creatDate) {
		this.name = name;
		this.adPositionId = adPositionId;
		this.url = url;
		this.img = img;
		this.isShow = isShow;
		this.orderNo = orderNo;
		this.creater = creater;
		this.creatDate = creatDate;
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

	@Column(name = "Name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "AdPositionId")
	public Integer getAdPositionId() {
		return this.adPositionId;
	}

	public void setAdPositionId(Integer adPositionId) {
		this.adPositionId = adPositionId;
	}

	@Column(name = "Url", length = 500)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Column(name = "Img")
	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Column(name = "IsShow")
	public Integer getIsShow() {
		return this.isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

	@Column(name = "OrderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Column(name = "Creater")
	public String getCreater() {
		return this.creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	@Column(name = "CreatDate", length = 19)
	public Timestamp getCreatDate() {
		return this.creatDate;
	}

	public void setCreatDate(Timestamp creatDate) {
		this.creatDate = creatDate;
	}

}