package com.yuankang.yk.pojo.sys;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * AdPosition entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ad_position", catalog = "yikang")
public class AdPosition implements java.io.Serializable {

	// Fields

	private Integer id;
	private String posName;
	private Integer width;
	private Integer height;
	private String des;

	// Constructors

	/** default constructor */
	public AdPosition() {
	}

	/** full constructor */
	public AdPosition(String posName, Integer width, Integer height, String des) {
		this.posName = posName;
		this.width = width;
		this.height = height;
		this.des = des;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "PosName")
	public String getPosName() {
		return this.posName;
	}

	public void setPosName(String posName) {
		this.posName = posName;
	}

	@Column(name = "Width")
	public Integer getWidth() {
		return this.width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	@Column(name = "Height")
	public Integer getHeight() {
		return this.height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	@Column(name = "Des", length = 500)
	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

}