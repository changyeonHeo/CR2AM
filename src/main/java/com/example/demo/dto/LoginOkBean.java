package com.example.demo.dto;

public class LoginOkBean {
	private String id;
	private String passwd;
	
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getId() {
		return id;
	}
//	public int loginOk(MemberDAO dao) { // 이런방식으로 주입을 받아야됨 기존의 MemberDAO를 써야 되니까  (new하고 받으면 안되)
//		try {
//			MemberDTO dto = dao.getMember(id);
//			if (dto != null) {
//				if (dto.getPasswd().trim().equals(passwd)) {
//					return OK;
//				}else {
//					return NOT_PW;
//				}
//			}else {
//				return NOT_ID;
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//			return ERROR;
//		}
//	}
	
	public int loginOk(MemberDTO dto) {
		try {
			if (dto != null) {
				if (dto.getPasswd().trim().equals(passwd)) {
					return OK;
				}else {
					return NOT_PW;
				}
			}else {
				return NOT_ID;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
