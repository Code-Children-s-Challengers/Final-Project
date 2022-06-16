package com.ccc.controller;

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
import com.ccc.dto.NoticePageDTO;
import com.ccc.dto.UserDTO;
import com.ccc.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@GetMapping(value="/board/noticeList")
	public String notice(Model m, @RequestParam(defaultValue="1") String curPage, 
			String perPage, 			
			HttpServletRequest request) throws Exception{		
		
		System.out.println(curPage);
		if(curPage == "") curPage = "1";		
		
		NoticePageDTO list = service.selectNoticePage(Integer.parseInt(curPage));
		// selectNoticePage가 실행되면서 totalCount가 set 되어야함.
		
		int tot = list.getTotalCount() / list.getPerPage();
		if(list.getTotalCount() % list.getPerPage() != 0) tot++;
		
		List<NoticeDTO> allList = service.selectAllNotice();		
		
		m.addAttribute("list", list);
		m.addAttribute("curPage", curPage);				
		m.addAttribute("totalPage", tot);
		//m.addAttribute("uname",uname);
		
		return "board/noticeList";
	}
	
	//쿼리문을 받은 것에 대한 처리(id를 넘겨 받아 해당 content를 출력)
	@GetMapping(value="/board/noticeContent")
	public String content(Model m, @RequestParam int id,
			@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{	
		
		NoticeDTO dto = service.selectNoticeContent(id);
		System.out.println(dto);
		m.addAttribute("dto", dto);
		
		return "board/noticeContent";
	}
	
	
	
	
	
	@GetMapping(value="/board/noticeSearch")	
	public String noticeSerach(@RequestParam("type") String type,
							   @RequestParam("keyword") String keyword,
							   @RequestParam(value = "date1", defaultValue="2000-01-01") String date1,
							   @RequestParam(value = "date2", defaultValue="2049-12-31") String date2,
							   @RequestParam(defaultValue="1") String curPage,
							   @AuthenticationPrincipal PrincipalDetails principalDetails,
			Model m) throws Exception{
		
		System.out.println("type:" + type);
		System.out.println(keyword);
		
		if(curPage == "") curPage = "1";	
		
		NoticeDTO sDTO = new NoticeDTO();
		
		sDTO.setType(type);
		sDTO.setKeyword(keyword);
		sDTO.setDate1(date1);
		sDTO.setDate2(date2);
		
		NoticePageDTO searchList = service.searchNotice(sDTO, Integer.parseInt(curPage));		
		
		int tot = service.selectCount(sDTO) / searchList.getPerPage() + 1;
		if(searchList.getTotalCount() % searchList.getPerPage() == 0) tot++;
						
		System.out.println("total Page" + tot);
		m.addAttribute("curPage", curPage);				
		m.addAttribute("totalPage", tot);
		m.addAttribute("type",type);
		m.addAttribute("keyword",keyword);		
		m.addAttribute("searchList", searchList);
		
		return "board/noticeSearch";
	}
	
	
	@Secured("ROLE_USER")
	@GetMapping(value="/board/noticeUpdate")
	public String updateForm(@RequestParam int id, Model m,
			@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{	
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		System.out.println(writerId);
		if ("admin".equals(writerId)) {
			m.addAttribute("id",id);
			return "board/noticeUpdate";
			
		} else {
			return "board/NoticeLoginFail";
		}
	}
	
	@Secured("ROLE_USER")
	@GetMapping(value="/board/noticeWriteInsert")
	public String writeSave(NoticeDTO dto,@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		if ("admin".equals(writerId)) {
			dto.setWriterId(writerId);
			int num = service.insertNotice(dto);		
			return "board/notice/noticeWriteSuccess";
			
		} else {
			return "board/NoticeLoginFail";
		}		
		
	}
	@Secured("ROLE_USER")
	@GetMapping(value="/board/noticeUpdateInsert")
	public String updateNotice(@RequestParam("id") String id,
							   @RequestParam("title") String title,
							   @RequestParam("content") String content,		
							   @AuthenticationPrincipal PrincipalDetails principalDetails,
							   Model m) throws Exception{
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		if ("admin".equals(writerId)) {
			NoticeDTO uDTO = new NoticeDTO();
			
			uDTO.setModiuname(writerId);
			uDTO.setId(Integer.parseInt(id));
			uDTO.setTitle(title);
			uDTO.setContent(content);			
			
			int num = service.updateNotice(uDTO);
			
			return "board/notice/noticeUpdateSuccess";	
		} else {
			return "board/NoticeLoginFail";
		}
			
	}
	
	@Secured("ROLE_USER")
	@GetMapping(value="/board/noticeDelete")
	public String delete(HttpServletRequest request, 
			@RequestParam int id,
			@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{
		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		if ("admin".equals(writerId)) {
			int num = service.deleteNotice(id);
			
			return "board/notice/noticeDeleteSuccess";
		} else {
			return "board/NoticeLoginFail";
		}
		
	}

	@Secured("ROLE_USER")
	@GetMapping(value="/board/noticeWrite")
	public String writeForm(@AuthenticationPrincipal PrincipalDetails principalDetails) throws Exception{		
		UserDTO userDTO = principalDetails.getUser();
		String writerId = userDTO.getUsername();
		if ("admin".equals(writerId)) {
			return "board/noticeWrite";
		} else {
			return "board/NoticeLoginFail";
		}
		
	}
}
