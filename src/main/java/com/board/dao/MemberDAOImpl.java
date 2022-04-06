package com.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.memberMapper";
	
	
	@Override
	public void register(MemberVO vo) throws Exception {
		
		sql.insert(namespace + ".register" , vo);
	}


	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sql.selectOne(namespace + ".login", vo);		
	}

}
