package com.ccc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ccc.config.login.auth.PrincipalDetails;
import com.ccc.dto.NoticeDTO;
import com.ccc.dto.QnABoardDTO;
import com.ccc.dto.QnABoardPageDTO;
import com.ccc.dto.UserDTO;
import com.ccc.service.QnABoardService;

@Controller
public class QnABoardController {
	@Autowired
	QnABoardService service;
	
	@GetMapping(value="/board/QnABoardList")
	public String QnABoard(Model m, @RequestParam(defaultValue="1") String curPage, HttpServletRequest request) throws Exception{
		
		System.out.println(curPage);
		if(curPage == "") curPage = "1";		
										
		QnABoardPageDTO list = service.selectQnABoardPage(Integer.parseInt(curPage));
		// selectNoticePage가 실행되면서 totalCount가 set 되어야함.
		
		
		int tot = list.getTotalCount() / list.getPerPage();
		if(list.getTotalCount() % list.getPerPage() != 0) tot++;		
					
		List<QnABoardDTO> answersList = list.getList();
				
		ArrayList<String> resultAnswer = new ArrayList<String>();
		
		for(QnABoardDTO answer : answersList) {			
			int id = answer.getId();			
			String qcon = answer.getAcontent();			
			
			try {
				if (qcon.length()>0)
					resultAnswer.add("Y");
			} catch (Exception e) {
				resultAnswer.add("N");
			}
			//System.out.println("".equals(q));
//			if(result.equals("null")) {
//				System.out.println("여기5");
//				results.add("N");
//			}
//			else {
//				System.out.println("여기5");
//				results.add("Y");
//			}
			// null 값을 비교하는 방법은 보통 equals와 ==을 이용한 2가지 있다.
			//1. null.equals(Stirng) -> null 객체에서 equals 메소드 호출이 불가하여 Exception이 발생한다.
			//나의 경우에도 null을 해당 문자와 비교하려고하여 계속해서 Exception이 발생함.
			//따라서, "".equals(String)의 형태를 이용하는 것을 권장한다.
			//2. String == null
			// ==의 경우, 주소값을 비교하는 연산자이다.
			// 따라서, 값이 같아도 주소값이 다르다면 false가 출력되서 원하는 값을 얻을 수 없다.
			// 반면 equals는 메소드로 실제 내용 자체를 비교하기 때문에 보다 정확한 결과값을 얻을 수 있다.
			// 근데 해결이 안되서 try catch로 해결함.
			
		}
				
		System.out.println(resultAnswer);
		
		m.addAttribute("resultAnswer",resultAnswer);
		m.addAttribute("list", list);
		m.addAttribute("curPage", curPage);				
		m.addAttribute("totalPage", tot);
		
		return "board/QnABoardList";
	}
	
	//쿼리문을 받은 것에 대한 처리(id를 넘겨 받아 해당 content를 출력)
	@GetMapping(value="/board/QnABoardContent")
	public String content(Model m, @RequestParam int id) throws Exception{	
		
		QnABoardDTO dto = service.selectQnABoardContent(id);
		System.out.println(dto);
		m.addAttribute("dto", dto);
		
		return "board/QnABoardContent";
	}
	
	
	
	@GetMapping(value="/board/QnABoardSearch")	
	public String QnABoardSerach(@RequestParam("type") String type,
							   @RequestParam("keyword") String keyword,
							   @RequestParam(value = "date1", defaultValue="2000-01-01") String date1,
							   @RequestParam(value = "date2", defaultValue="2049-12-31") String date2,
							   @RequestParam(defaultValue="1") String curPage,
			Model m) throws Exception{
		
		System.out.println("type:" + type);
		System.out.println(keyword);
		
		if(curPage == "") curPage = "1";	
		
		QnABoardDTO sDTO = new QnABoardDTO();
		
		sDTO.setType(type);
		sDTO.setKeyword(keyword);
		sDTO.setDate1(date1);
		sDTO.setDate2(date2);
		
		QnABoardPageDTO searchList = service.searchQnABoard(sDTO, Integer.parseInt(curPage));
		
		int tot = service.selectCount(sDTO) / searchList.getPerPage() + 1;
		if(searchList.getTotalCount() % searchList.getPerPage() == 0) tot++;
		
		List<QnABoardDTO> answersList = searchList.getList();
		
		ArrayList<String> resultAnswer = new ArrayList<String>();
		
		for(QnABoardDTO answer : answersList) {			
			int id = answer.getId();			
			String qcon = answer.getAcontent();			
			
			try {
				if (qcon.length()>0)
					resultAnswer.add("Y");
			} catch (Exception e) {
				resultAnswer.add("N");
			}			
		}
				
		System.out.println("여기" + resultAnswer);
		
		m.addAttribute("resultAnswer",resultAnswer);
		System.out.println(tot);
		m.addAttribute("curPage", curPage);				
		m.addAttribute("totalPage", tot);
		m.addAttribute("type",type);
		m.addAttribute("keyword",keyword);		
		m.addAttribute("searchList", searchList);
		
		return "board/QnABoardSearch";
	}

	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardDelete")
	public String delete(HttpServletRequest request, @RequestParam int id,
			@AuthenticationPrincipal PrincipalDetails principalDetails
			) throws Exception{
		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		
		String checkWriterId = service.selectQnABoardContent(id).getWriterId();
		System.out.println(writerId);
		if (checkWriterId.equals(writerId) || "admin".equals(writerId)) {

			int num = service.deleteQnABoard(id);
			
			return "board/QnABoard/QnABoardDeleteSuccess";
			
		} else {
			return "board/QnABoardLoginFail";
		}
	}

	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardQWrite")
	public String writeQForm(@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();		
		
		System.out.println(writerId);
		if (writerId != null) {
			return "board/QnABoardQWrite";
		} else {
			return "board/QnABoardLoginFail";
		}
		
	}
	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardAWrite")
	public String writeAForm(@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();		
		
		System.out.println(writerId);
		if ("admin".equals(writerId)) {
			return "board/QnABoardAWrite";
		} else {
			return "board/QnABoardLoginFail";
		}
		
		
	}
	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardQWriteInsert")
	public String writeQSave(QnABoardDTO dto,
			@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();		
		
		System.out.println("여기" + writerId);
		if (writerId != null) {
			dto.setWriterId(writerId);
			System.out.println(dto);			
			
			int num = service.insertQQnABoard(dto);		
			
			return "board/QnABoard/QnABoardWriteSuccess";
		} else {
			return "board/QnABoardLoginFail";
		}
		
	}
	@Secured("ROLE_USER")						
	@GetMapping(value="/board/QnABoardQUpdate")
	public String updateQForm(@RequestParam int id, Model m,
			@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		
		String checkWriterId = service.selectQnABoardContent(id).getWriterId();
		System.out.println(checkWriterId);
		if (checkWriterId.equals(writerId) || "admin".equals(writerId)) {
			m.addAttribute("id",id);
			return "board/QnABoardQUpdate";
			
		} else {
			return "board/QnABoardLoginFail";
		}
		
	}	
	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardQUpdateInsert")
	public String QnABoardQUpdate(@RequestParam("id") int id,
							   @RequestParam("title") String title,
							   @RequestParam("qcontent") String qcontent,							   
							   Model m,
							   @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
			
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		
		String checkWriterId = service.selectQnABoardContent(id).getWriterId();
		System.out.println("나오나?" + writerId);
		System.out.println("나오나?" + checkWriterId);
		if (checkWriterId.equals(writerId) || "admin".equals(writerId)) {
			QnABoardDTO uDTO = new QnABoardDTO();
			
			uDTO.setId(id);
			uDTO.setTitle(title);
			uDTO.setQcontent(qcontent);
			uDTO.setModiuname(writerId);
			
			int num = service.updateQQnABoard(uDTO);
			
			return "board/QnABoard/QnABoardUpdateSuccess";
			
		} else {
			return "board/QnABoardLoginFail";
		}
	}
	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardAUpdate")
	public String updateAForm(@RequestParam int id, 
							@RequestParam String title,
							Model m,
							@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{		
		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		
		String checkWriterId = service.selectQnABoardContent(id).getWriterId();
		System.out.println(writerId);
		if ("admin".equals(writerId)) {
			m.addAttribute("id",id);
			m.addAttribute("title",title);
			return "board/QnABoardAUpdate";
			
		} else {
			return "board/QnABoardLoginFail";
		}
		
	}	
	@Secured("ROLE_USER")
	@GetMapping(value="/board/QnABoardAUpdateInsert")
	public String QnABoardAUpdate(@RequestParam("id") int id,							   
							   @RequestParam("acontent") String acontent,							   
							   Model m,
							   @AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		
		String checkWriterId = service.selectQnABoardContent(id).getWriterId();
		System.out.println(writerId);
		if ("admin".equals(writerId)) {
			QnABoardDTO uDTO = new QnABoardDTO();
			
			uDTO.setId(id);		
			uDTO.setAcontent(acontent);		
			
			int num = service.updateAQnABoard(uDTO);
			
			return "board/QnABoard/QnABoardUpdateSuccess";	
			
		} else {
			return "board/QnABoardLoginFail";
		}
		
			
	}
	
	
}
