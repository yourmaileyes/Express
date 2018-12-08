package com.dzx.express.mapper;

import java.util.List;

import com.dzx.express.entity.User;

public interface UserMapper {
	List<User> selectbypt(String pt);
	
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}