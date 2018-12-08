package com.dzx.express.mapper;

import java.util.List;

import com.dzx.express.entity.Express;

public interface ExpressMapper {
	List<Express> selectall(String location);
	
	List<Express> selectbyphone(String phone);
	
    int deleteByPrimaryKey(String id);

    int insert(Express record);

    int insertSelective(Express record);

    Express selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Express record);

    int updateByPrimaryKey(Express record);
}