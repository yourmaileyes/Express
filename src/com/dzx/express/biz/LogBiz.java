package com.dzx.express.biz;

import java.util.List;

import com.dzx.express.entity.Log;

public interface LogBiz {
	  int deleteByPrimaryKey(Integer logid);

	    int insert(Log record);

	    int insertSelective(Log record);

	    Log selectByPrimaryKey(Integer logid);

	    int updateByPrimaryKeySelective(Log record);

	    int updateByPrimaryKey(Log record);
	    
	    List<Log> selectlog(String expressid);
}
