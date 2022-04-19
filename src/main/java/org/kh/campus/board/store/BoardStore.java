package org.kh.campus.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.campus.board.domain.Board;
import org.kh.campus.board.domain.BoardReply;
import org.kh.campus.board.domain.Search;

public interface BoardStore {

	public	List<Board> selectAllBoard(SqlSession sqlSession);

	public Board selectOneBoard(SqlSession sqlSession, int boardNo);

	public List<Board> selectSearchBoard(SqlSession sqlSession, Search search);

	public int insertBoard(Board board, SqlSession sqlSession);

	public int updateBoard(Board board, SqlSession sqlSession);

	public int deleteBoard(int boardNo, SqlSession sqlSession);

	public List<BoardReply> selectAllBoardReply(int boardNo, SqlSession sqlSession);

	public int insertBoardReply(BoardReply boardReply, SqlSession sqlSession);

	public int updateBoardReply(BoardReply boardReply, SqlSession sqlSession);

	public int deleteBoardReply(BoardReply boardReply, SqlSession sqlSession);

}
