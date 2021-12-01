package kr.co.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BoardService;
//import kr.co.study.HomeController;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;

@Controller
public class BoardController {
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Inject
   BoardService service;
   
   //home ȭ��
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      String formattedDate = dateFormat.format(date);
      model.addAttribute("serverTime", formattedDate );
      return "home";
   }
   
   // �Խ��� �� �ۼ� ȭ��
   @RequestMapping(value = "/board/writeView", method = RequestMethod.GET)
   public void writeView() throws Exception{
      logger.info("writeView");
   }
   
   // �Խ��� �� �ۼ�
   @RequestMapping(value = "/board/write", method = RequestMethod.POST)
   public String write(BoardVO boardVO) throws Exception{
      logger.info("write");
      service.write(boardVO); 
      return "redirect:/board/list";
   }
   
   // �Խ��� �� ��� ��ȸ
   @RequestMapping(value = "board/list", method = RequestMethod.GET)
   public String list(Model model, Criteria cri) throws Exception{
      logger.info("list"); 
      model.addAttribute("list", service.list(cri)); 
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(service.listCount()); 
      model.addAttribute("pageMaker", pageMaker); 
      return "board/list";  
   }
   
   // �Խ��� ��ȸ
  @RequestMapping(value = "board/readView", method = RequestMethod.GET)
   public String read(BoardVO boardVO, Model model) throws Exception{
      logger.info("read");
      model.addAttribute("read", service.read(boardVO.getBno()));
      return "board/readView";
   }
   
   // �Խ��� ����ȭ�� 
   @RequestMapping(value = "board/updateView", method = RequestMethod.GET)
   public String updateView(BoardVO boardVO, Model model) throws Exception{
      logger.info("updateView");   
      model.addAttribute("update", service.read(boardVO.getBno()));   
      return "board/updateView";
   }
      
   // �Խ��� ����
   @RequestMapping(value = "board/update", method = RequestMethod.POST)
   public String update(BoardVO boardVO) throws Exception{
      logger.info("update");   
      service.update(boardVO);
      return "redirect:/board/list";
   }
   // �Խ��� ����
   @RequestMapping(value = "board/delete", method = RequestMethod.POST)
   public String delete(BoardVO boardVO) throws Exception{
      logger.info("delete");
      service.delete(boardVO.getBno());   
      return "redirect:/board/list";
   }
   
   // �Խ��� �亯ȭ��
   @RequestMapping(value = "board/replyView", method = RequestMethod.GET)
   public String replyView(BoardVO boardVO, Model model) throws Exception{
      logger.info("replyView");   
      model.addAttribute("reply", service.read(boardVO.getBno()));   
      return "board/replyView";
   }
      
   // �Խ��� �亯
   @RequestMapping(value = "board/reply", method = RequestMethod.POST)
   public String reply(BoardVO boardVO) throws Exception{
      logger.info("reply");   
      service.reply(boardVO);
      return "redirect:/board/list";
   }
}