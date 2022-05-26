package com.ccc.sms;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
//누구에게 보낼건지? 어떤 내용을 보낼건지?
public class MessageDTO {
    private String to;
    private String content;
}