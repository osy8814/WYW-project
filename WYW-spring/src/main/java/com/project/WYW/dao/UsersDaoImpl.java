package com.project.WYW.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.WYW.domain.UsersDto;


@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace="com.project.WYW.dao.usersMapper.";
	
	@Override
	public int count() throws Exception{
		return session.selectOne(namespace + "count");
	}
	
	@Override
	public List<UsersDto> selectAll() throws Exception{
		return session.selectList(namespace + "selectAll");
	}
	
	@Override
	public UsersDto select(String user_id) throws Exception{
		return session.selectOne(namespace+"select", user_id);
	}
	
	@Override
	public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }
	
	@Override
	public int delete(String user_id, String email, String name) throws Exception {
        Map map = new HashMap();
        map.put("user_id", user_id);
        map.put("email", email);
        map.put("name", name);
        return session.delete(namespace+"delete", map);
    }
	
	@Override
	public int insert(UsersDto dto) throws Exception {
        return session.insert(namespace+"insert", dto);
    }

	@Override
    public int update(UsersDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    }
	
}