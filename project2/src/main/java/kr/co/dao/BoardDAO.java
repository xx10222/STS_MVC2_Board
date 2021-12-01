package kr.co.dao;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;

import java.util.List;

public interface BoardDAO {
   public void write(BoardVO boardVO) throws Exception;
   // �Խù� ��� ��ȸ
   public List<BoardVO> list(Criteria cri) throws Exception;
   // �Խù� �� ����
   public int listCount() throws Exception;
   // �Խù� ��ȸ
   public BoardVO read(int bno) throws Exception;
   // �Խù� ����
   public void update(BoardVO boardVO) throws Exception;
   // �Խù� ����
   public void delete(int bno) throws Exception;
   // �Խ��� ��ȸ��
   public void boardHit(int bno) throws Exception;
   // �Խ��� ���
   public void reply(BoardVO boardVO) throws Exception;
   //���� ������Ʈ
   public void deletesort(BoardVO boardVO) throws Exception;
   //������ ��ȸ
   public BoardVO deleteread(int bno) throws Exception;
}