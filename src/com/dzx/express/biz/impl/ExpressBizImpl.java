package com.dzx.express.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzx.express.biz.ExpressBiz;
import com.dzx.express.entity.Express;
import com.dzx.express.mapper.ExpressMapper;
@Service(value="ExpressBiz")
public class ExpressBizImpl implements ExpressBiz{
	@Autowired
	ExpressMapper expressMapper;

	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return expressMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Express record) {
		// TODO Auto-generated method stub
		return expressMapper.insert(record);
	}

	@Override
	public int insertSelective(Express record) {
		// TODO Auto-generated method stub
		return expressMapper.insertSelective(record);
	}

	@Override
	public Express selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return expressMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Express record) {
		// TODO Auto-generated method stub
		return expressMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Express record) {
		// TODO Auto-generated method stub
		return expressMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Express> selectbyphone(String phone) {
		// TODO Auto-generated method stub
		return expressMapper.selectbyphone(phone);
	}

	@Override
	public List<Express> selectall(String location) {
		// TODO Auto-generated method stub
		return expressMapper.selectall(location);
	}

}
