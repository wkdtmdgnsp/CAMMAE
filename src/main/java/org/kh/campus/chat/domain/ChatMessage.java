package org.kh.campus.chat.domain;

public class ChatMessage {
	private String marketNo;
	private String cmd;
	private String msg;
	
	public ChatMessage() {}

	public ChatMessage(String marketNo, String cmd, String msg) {
		super();
		this.marketNo = marketNo;
		this.cmd = cmd;
		this.msg = msg;
	}

	public String getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(String marketNo) {
		this.marketNo = marketNo;
	}

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "ChatMessage [marketNo=" + marketNo + ", cmd=" + cmd + ", msg=" + msg + "]";
	}
	
	

}
