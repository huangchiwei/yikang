package com.yuankang.yk.pojo.medicalguide;

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
 * SpecialInfo entity
 */
@Entity
@Table(name = "t_special_info", catalog = "yikang")
public class SpecialInfo implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String introduction;
	private Integer isBlock;
	private Set<Relation> relations = new HashSet<Relation>(0);


	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "s_id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "s_name", length = 128)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "s_introduction")
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "is_block")
	public Integer getIsBlock() {
		return this.isBlock;
	}

	public void setIsBlock(Integer isBlock) {
		this.isBlock = isBlock;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "specialInfo")
	public Set<Relation> getRelations() {
		return this.relations;
	}

	public void setRelations(Set<Relation> relations) {
		this.relations = relations;
	}

}