package kr.co.vo;
import java.util.Date;

public class BoardVO {
		
		private int bno;
		private String title;
		private String content;
		private String writer;
		private Date regdate;
		private int hit;
		private int groupno;
		private int fk_seq;
		private int depthno;
		
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public int getGroupno() {
			return groupno;
		}
		public void setGroupno(int groupno) {
			this.groupno = groupno;
		}
		public int getFk_seq() {
			return fk_seq;
		}
		public void setFk_seq(int fk_seq) {
			this.fk_seq = fk_seq;
		}
		public int getDepthno() {
			return depthno;
		}
		public void setDepthno(int depthno) {
			this.depthno = depthno;
		}
}