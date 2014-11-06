package com.yuankang.yk.pojo.sys;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TExpertInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_expert_info", catalog = "yikang")
public class TExpertInfo implements java.io.Serializable {

	// Fields

	private String EId;
	private String EName;
	private String EAvatar;
	private String EIntroduction;
	private Integer isBlock;
	private Set<TRelation> TRelations = new HashSet<TRelation>(0);

	// Constructors

	/** default constructor */
	public TExpertInfo() {
	}

	/** full constructor */
	public TExpertInfo(String EName, String EAvatar, String EIntroduction,
			Integer isBlock, Set<TRelation> TRelations) {
		this.EName = EName;
		this.EAvatar = EAvatar;
		this.EIntroduction = EIntroduction;
		this.isBlock = isBlock;
		this.TRelations = TRelations;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "e_id", unique = true, nullable = false, length = 32)
	public String getEId() {
		return this.EId;
	}

	public void setEId(String EId) {
		this.EId = EId;
	}

	@Column(name = "e_name", length = 32)
	public String getEName() {
		return this.EName;
	}

	public void setEName(String EName) {
		this.EName = EName;
	}

	@Column(name = "e_avatar", length = 128)
	public String getEAvatar() {
		return this.EAvatar;
	}

	public void setEAvatar(String EAvatar) {
		this.EAvatar = EAvatar;
	}

	@Column(name = "e_introduction")
	public String getEIntroduction() {
		return this.EIntroduction;
	}

	public void setEIntroduction(String EIntroduction) {
		this.EIntroduction = EIntroduction;
	}

	@Column(name = "is_block")
	public Integer getIsBlock() {
		return this.isBlock;
	}

	public void setIsBlock(Integer isBlock) {
		this.isBlock = isBlock;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "TExpertInfo")
	public Set<TRelation> getTRelations() {
		return this.TRelations;
	}

	public void setTRelations(Set<TRelation> TRelations) {
		this.TRelations = TRelations;
	}

}