package com.creator.link.Member;

public interface Member_Service {

	void regist(String rgId, String rgPw, String rgName, String rgBirthDate, String rgPhone);

	Member_DTO memberLogin(String loginId, String loginPw);

	Member_DTO myPage(String myId);

	int infoCheck(String exId, String exPw);

	void passwordModify(String exId, String exPw, String mdPw);

	int checkNickName(String vrNickName);

	void mdMyInfo(int myNumber, String myId, String myPhoto, String myNickName, String myBirthDate, String myPhone,
			String myEmail, String myAddrPost, String myAddrRoad, String myAddrLocal, String myAddrDetail, String myAttribute);

	int idCheck(String vrId);

	int password_check(String exId, String exPwVr);
	
}