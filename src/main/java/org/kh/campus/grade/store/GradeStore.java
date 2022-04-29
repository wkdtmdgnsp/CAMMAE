package org.kh.campus.grade.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.campus.grade.domain.Grade;

public interface GradeStore {

	public List<Grade> selectGradeStudent(int studentNo, SqlSession sqlSession);

	public List<Grade> selectFeedbackStudent(int studentNo, SqlSession sqlSession);

	public int insertObjection(Grade grade, SqlSession sqlSession);

	public List<Grade> selectGradeProfessor(int prfNo, SqlSession sqlSession);

	public int insertGrade(Grade grade, SqlSession sqlSession);

	public int updateGrade(Grade grade, SqlSession sqlSession);
	
	public List<Grade> selectFeedbackProfessor(int prfNo, SqlSession sqlSession);

	public int insertFeedBack(Grade grade, SqlSession sqlSession);

	public int updateFeedBack(Grade grade, SqlSession sqlSession);

	public int deleteFeedBack(int pNo, SqlSession sqlSession);

}
