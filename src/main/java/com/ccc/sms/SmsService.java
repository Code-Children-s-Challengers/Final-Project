package com.ccc.sms;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service
@Transactional
@PropertySource("classpath:/sms.properties")
public class SmsService {

    @Value("${sms.serviceId}")
    private String serviceId;
    
    @Value("${sms.accessKey}")
    private String accessKey;
    
    @Value("${sms.secretKey}")
    private String secretKey;

    //Request 객체 => recipientPhoneNumber, content, title
    public SmsResponse sendSms(String recipientPhoneNumber, String content) throws JsonProcessingException, UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException, URISyntaxException {
        // 현재 시간
    	Long time = System.currentTimeMillis();
        
        // 메세지 생성
        List<MessageDTO> messages = new ArrayList<>(); //리스트로 만든 이유는 여러 사람에게 보내기 위해서..?
        messages.add(new MessageDTO(recipientPhoneNumber, content)); //MessageDTO의 필드값 => to(누구에게 보낼 것인지), content(보낼 내용)

        // 이제 네이버 클라우드에게 문자 발송을 유청할 것인데(문자발송은 우리가 하는 게 아니고 네이버 클라우드가 해주니까), 그 발송 요청 정보를 담는다
        SmsRequest smsRequest = new SmsRequest("SMS", "COMM", "82", "01084533398", "이거는 뭐하는걸까", messages);
       
        // json 형태로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonBody = objectMapper.writeValueAsString(smsRequest);

        // 헤더 설정 값 세팅
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("x-ncp-apigw-timestamp", time.toString());  //1970년 1월 1일 00:00:00 협정 세계시(UTC)부터의 경과 시간을 밀리초(Millisecond)로 나타낸 것
        headers.set("x-ncp-iam-access-key", this.accessKey); // 발급받은 Access Key ID
        
        // signature 서명
        String sig = makeSignature(time); //암호화
        headers.set("x-ncp-apigw-signature-v2", sig); // Body를 Access Key Id와 맵핑되는 SecretKey로 암호화한 서명

        // 발송 요청을 위한 header와 body를 한 데 묶어서 보낼 준비
        HttpEntity<String> body = new HttpEntity<>(jsonBody,headers);

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
        SmsResponse smsResponse = restTemplate.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/"+this.serviceId+"/messages"), body, SmsResponse.class);
        //restTemplate.postForObject => post 요청을 보내고 결과로 객체를 반환받는다
        return smsResponse;ㄴ

    }
    
    //Signature 생성하기
    //요청에 맞게 StringToSign을 생성하고 SecretKey로 HmacSHA256 알고리즘으로 암호화한 후 Base64로 인코딩합니다.
    //이 값을 x-ncp-apigw-signature-v2로 사용합니다.
    public String makeSignature(Long time) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {

        String space = " ";
        String newLine = "\n";
        String method = "POST";
        String url = "/sms/v2/services/"+ this.serviceId+"/messages";
        String timestamp = time.toString();
        String accessKey = this.accessKey;
        String secretKey = this.secretKey;

        String message = new StringBuilder()
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(accessKey)
                .toString();

        SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);

        byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
        String encodeBase64String = Base64.encodeBase64String(rawHmac);

        return encodeBase64String;
    }
}