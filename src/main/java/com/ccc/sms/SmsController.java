package com.ccc.sms;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SmsController {

	// final => 자동으로 Autowired 됨
    private final SmsService smsService;

    // url을 무엇으로 매핑해야 될지?
    @PostMapping("/checkPhoneNumber")                             // 요청 값을 Request타입의 객체로 받는다
   	public ResponseEntity<SmsResponse> test(@RequestBody Request request) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
    	System.out.println(request.getRecipientPhoneNumber());
    
    	int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
    	String content = "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다.";
    	
    	SmsResponse data = smsService.sendSms(request.getRecipientPhoneNumber().substring(1) , content);
    	data.setRandomNumber(randomNumber);
    	// SmsResponse 타입의 데이터를 json의 body에 포함하여 보낸다
    	return ResponseEntity.ok().body(data); // data에는 header 와 Body가 저장되어 있음, 따라서 응답 시 필요한 status, header, body정보가 다 알맞게 입력된 것!
    
    }
}
