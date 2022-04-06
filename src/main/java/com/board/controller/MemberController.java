package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.MemberVO;
import com.board.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService service;
	
	//회원가입 get
	@GetMapping("/register")
	public void getRegister() throws Exception{
		logger.info("getRegister()");
	}
	
	//회원가입 post
	@PostMapping("/register")
	public String postRegister(MemberVO vo) throws Exception{
		logger.info("postRegister()");
		
		service.register(vo);
		
		return "redirect:/";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("login()");
		
		//httpsession은 httpservletrequest.getsession()를 이용하여 생성할수 있다.
		HttpSession session = request.getSession();
		
		MemberVO login = service.login(vo);	
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}

		return "redirect:/";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception{
		logger.info("logout()");
		
		session.invalidate();
		
		return "redirect:/";
	}
}
