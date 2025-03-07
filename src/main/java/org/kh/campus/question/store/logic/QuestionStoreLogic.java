package org.kh.campus.question.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.kh.campus.lecture.domain.Lecture;
import org.kh.campus.question.domain.PageInfo;
import org.kh.campus.question.domain.Question;
import org.kh.campus.question.domain.QuestionReply;
import org.kh.campus.question.store.QuestionStore;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionStoreLogic implements QuestionStore {

	@Override
	public List<Question> selectAllQuestion(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getQuestionLimit();
		int currentPage = pi.getCurrentPage();
		int offset = (currentPage - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		List<Question> qList = sqlSession.selectList("QuestionMapper.selectAllQuestion", pi, rowBounds);
		return qList;
	}

	@Override
	public Question selectOneQuestion(SqlSession sqlSession, int questionNo) {
		Question question = sqlSession.selectOne("QuestionMapper.selectOneQuestion", questionNo);
		return question;
	}

	@Override
	public int insertQuestion(Question question, SqlSession sqlSession) {
		int result = sqlSession.insert("QuestionMapper.insertQuestion", question);
		return result;
	}

	@Override
	public List<Lecture> selectAllPro(SqlSession sqlSession) {
		List<Lecture> lList = sqlSession.selectList("QuestionMapper.selectAllPro");
		return lList;
	}

	@Override
	public List<Lecture> selectAllLec(String professorName, SqlSession sqlSession) {
		List<Lecture> lList = sqlSession.selectList("QuestionMapper.selectAllLec", professorName);
		return lList;
	}

	@Override
	public int updateQuestion(Question question, SqlSession sqlSession) {
		int result = sqlSession.update("QuestionMapper.updateQuestion", question);
		return result;
	}

	@Override
	public int updateCount(int questionNo, SqlSession sqlSession) {
		int result = sqlSession.update("QuestionMapper.updateCount", questionNo);
		return result;
	}

	@Override
	public int deleteQuestion(int questionNo, SqlSession sqlSession) {
		int result = sqlSession.delete("QuestionMapper.deleteQuestion", questionNo);
		return result;
	}

	// 페이징
	@Override
	public int selectListCount(SqlSession sqlSession, PageInfo pageInfo) {
		int totalCount = sqlSession.selectOne("QuestionMapper.selectListCount", pageInfo);
		return totalCount;
	}

	// 댓글

	@Override
	public List<QuestionReply> selectAllReply(int questionNo, SqlSession sqlSession) {
		List<QuestionReply> qReplyList = sqlSession.selectList("QuestionMapper.selectAllReply", questionNo);
		return qReplyList;
	}

	@Override
	public int insertReply(QuestionReply questionReply, SqlSession sqlSession) {
		int result = sqlSession.insert("QuestionMapper.insertReply", questionReply);
		return result;
	}

	@Override
	public int updateReply(QuestionReply questionReply, SqlSession sqlSession) {
		int result = sqlSession.update("QuestionMapper.updateReply", questionReply);
		return result;
	}

	@Override
	public int deleteReply(QuestionReply questionReply, SqlSession sqlSession) {
		int result = sqlSession.delete("QuestionMapper.deleteReply", questionReply);
		return result;
	}

}
