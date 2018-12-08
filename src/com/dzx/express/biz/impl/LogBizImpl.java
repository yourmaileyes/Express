package com.dzx.express.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzx.express.biz.LogBiz;
import com.dzx.express.entity.Log;
import com.dzx.express.mapper.LogMapper;
@Service(value="LogBiz")
public class LogBizImpl implements LogBiz{
	@Autowired
	LogMapper logMapper;

	@Override
	public int deleteByPrimaryKey(Integer logid) {
		// TODO Auto-generated method stub
		return logMapper.deleteByPrimaryKey(logid);
	}

	@Override
	public int insert(Log record) {
		// TODO Auto-generated method stub
		return logMapper.insert(record);
	}

	@Override
	public int insertSelective(Log record) {
		// TODO Auto-generated method stub
		return logMapper.insertSelective(record);
	}

	@Override
	public Log selectByPrimaryKey(Integer logid) {
		// TODO Auto-generated method stub
		return logMapper.selectByPrimaryKey(logid);
	}

	@Override
	public int updateByPrimaryKeySelective(Log record) {
		// TODO Auto-generated method stub
		return logMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Log record) {
		// TODO Auto-generated method stub
		return logMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Log> selectlog(String expressid) {
		// TODO Auto-generated method stub
		return logMapper.selectlog(expressid);
	}

}
