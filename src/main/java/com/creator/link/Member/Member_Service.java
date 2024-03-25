package com.creator.link.Member;

public interface Member_Service {

	void regist(String rgId, String rgPw, String rgName, String rgBirthDate, String rgPhone);

	Member_DTO memberLogin(String loginId, String loginPw);

}
