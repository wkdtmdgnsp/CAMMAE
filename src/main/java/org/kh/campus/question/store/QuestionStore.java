package org.kh.campus.question.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.campus.question.domain.Question;

public interface QuestionStore {

	public List<Question> selectAllQuestion(SqlSession sqlSession);
	public int insertQuestion(Question question, SqlSession sqlSession);


}
