package com.yuankang.yk.service.base;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.yuankang.yk.dao.base.BaseDao;

/**
 * 
 * <pre>
 * 基础service实现类
 * </pre>
 */
@Component
@Transactional(readOnly=true)
public class BaseService<T> 
{
	@Resource
	private BaseDao<T> baseDao;

	@Transactional(readOnly=false)
	public void delete(T t)
	{
		baseDao.delete(t);
	}

	public List<T> findAll(Class<T> cls)
	{
		return baseDao.findAll(cls);
		
	}

	public T findById(Serializable id, Class<T> cls)
	{
		return baseDao.findById(id, cls);
		
	}

	@Transactional(readOnly=false)
	public void save(T t)
	{
		baseDao.save(t);
	}

	@Transactional(readOnly=false)
	public void update(T t)
	{
		baseDao.update(t);
	}

}
