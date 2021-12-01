package kr.co.dao;

import javax.inject.Inject;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
   @Inject
   private SqlSession sqlSession;
   
   // �Խñ� �ۼ�
   @Override
   public void write(BoardVO boardVO) throws Exception {
      sqlSession.insert("boardMapper.insert", boardVO);
   }
   // �Խù� ��� ��ȸ
   @Override
   public List<BoardVO> list(Criteria cri) throws Exception {
      return sqlSession.selectList("boardMapper.listPage",cri);
   }
   //�Խù� �� ����
   @Override
   public int listCount() throws Exception{
      return sqlSession.selectOne("boardMapper.listCount");
   }
   // �Խù� ��ȸ
   @Override
   public BoardVO read(int bno) throws Exception {
      return sqlSession.selectOne("boardMapper.read", bno);
   }
   // �Խù� ����
   @Override
   public void update(BoardVO boardVO) throws Exception {
      sqlSession.update("boardMapper.update", boardVO);
   }
   // �Խù� ����
   @Override
   public void delete(int bno) throws Exception {
      sqlSession.delete("boardMapper.delete", bno);
   }
   // �Խù� ��ȸ��
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.boardHit", bno);
	}
	// �Խù� ���
	@Override
	public void reply(BoardVO boardVO) throws Exception {
	    sqlSession.insert("boardMapper.reply", boardVO);
	}
	// fk_seq ������Ʈ
	@Override
	public void deletesort(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.deletesort", boardVO);
	}
	// ������ �Խù� ��ȸ
	@Override
	public BoardVO deleteread(int bno) throws Exception {
	     return sqlSession.selectOne("boardMapper.deleteread", bno);
	}
}