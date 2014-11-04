package com.yuankang.yk.dao.base;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * <pre>
 * 基础dao接口
 * </pre>
 */
public interface BaseDao<T>
{
	/**
	 * 
	 * <pre>
	 * 根据id和class得到一条实体
	 * </pre>
	 * @param id
	 * @param cls
	 * @return
	 */
	 T  findById(Serializable id,Class<T> cls);
	
	/**
	 * 
	 * <pre>
	 * 添加一条记录
	 * </pre>
	 * @param obj
	 * @return
	 */
	void save(T t);
	
	/**
	 * 
	 * <pre>
	 * 更新一条记录
	 * </pre>
	 * @param obj
	 * @return
	 */
	void update(T e);
	
	/**
	 * 
	 * <pre>
	 * 删除一条记录
	 * </pre>
	 * @param obj
	 * @return
	 */
	void delete(T e);
	
	/**
	 * 
	 * <pre>
	 * 查询所有记录
	 * </pre>
	 * @param cls
	 * @return
	 */
	List<T> findAll(Class<T> cls);
	
	
}
