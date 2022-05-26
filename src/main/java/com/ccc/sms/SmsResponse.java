package com.ccc.sms;

import java.time.LocalDateTime;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
// 응답 json의 body에 포하되어서 보내질 내용
public class SmsResponse {
	//요청 아이디
    private String requestId; 
    // 요청 시간
    private LocalDateTime requestTime;
    //요청 상태 코드 : 202-성공, 그 외 - 실패
    private String statusCode;
    //요청 상태명 : success - 성공, fail - 실패
    private String statusName;
}