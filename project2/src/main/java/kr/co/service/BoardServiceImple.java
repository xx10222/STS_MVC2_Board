package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.BoardDAO;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;

import java.util.List;

@Service
public class BoardServiceImple implements BoardService {
   @Inject
   private BoardDAO dao;
   public boolean f5;
   
   // �Խñ� �ۼ�
   @Override
   public void write(BoardVO boardVO) throws Exception {
      dao.write(boardVO);
   }
   // �Խù� ��� ��ȸ
   @Override
   public List<BoardVO> list(Criteria cri) throws Exception {
	   f5=true;
      return dao.list(cri);
   }
   // �Խù� �� ����
   @Override
   public int listCount() throws Exception{
      return dao.listCount();
   }
   // �Խù� ��ȸ
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		if(f5==true) {
			f5=false;
			dao.boardHit(bno);}
		return dao.read(bno);
	}
   
	//�Խñ� ����
   @Override
   public void update(BoardVO boardVO) throws Exception {
      dao.update(boardVO);
   }
   //�Խñ� ����
   @Override
   public void delete(int bno) throws Exception {
	  BoardVO vo = dao.deleteread(bno);
	  dao.deletesort(vo);
      dao.delete(bno);
   }
   //�Խù� ���
   @Override
   public void reply(BoardVO boardVO) throws Exception {
      dao.reply(boardVO);
   }
}