package com.spring.domain;

import java.util.Date;

public class ReplyVO {
	private Integer r_id;
	private Integer b_id;
	private String replytext;
	private String replyer;
	private String regdate;
	private Date updatedate;
	
    /*
     * 계층형 게시판을 위한 추가 필드
     * originNo, groupOrd, groupLayer 
     */
    /** 원글 번호 **/
    private int originId;
    
    /** 원글(답글포함)에 대한 순서 - 원글과 답글(과 답글의 답글)들은 originNo로 묶일것이다. 이것을 하나의 그룹으로 봤을때 그룹내의 순서를 의미한다. **/
    private int groupOrd;
 
    /** 답글 계층 - 원글에 대한 답글인지, 답글에 대한 답글인지를 구분하는 계층을 의미한다. **/
    private int groupLayer;
	
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getOriginId() {
		return originId;
	}
	public void setOriginId(int originId) {
		this.originId = originId;
	}
	public int getGroupOrd() {
		return groupOrd;
	}
	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}
	public int getGroupLayer() {
		return groupLayer;
	}
	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [r_id=" + r_id + ", b_id=" + b_id + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", originId=" + originId + ", groupOrd="
				+ groupOrd + ", groupLayer=" + groupLayer + "]";
	}
}
