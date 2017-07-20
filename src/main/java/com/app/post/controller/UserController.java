package com.app.post.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.post.model.User;
import com.app.post.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/signin",method=RequestMethod.GET)
	public String signInContainer(Model model,HttpSession session,HttpServletRequest request){
		User user=checkCookie(request);
		if(user==null){
			return "signin";
		}else{
			if (userService.checkForValidUser(user)) {
				session.setAttribute("userEmail", user.getUserEmail());
				return "redirect:/";
			}else{
				model.addAttribute("error", "Account's Invalid");
				return "signin";
			}
		}
		
		
	}
	
	@RequestMapping(value="/signin",method=RequestMethod.POST)
	public String signInuser(@ModelAttribute User user,Model model,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response){
		if(userService.checkForValidUser(user)){
			System.out.println(user);
			session.setAttribute("userEmail", user.getUserEmail());
			Cookie ckUserEmail=new Cookie("userEmail", user.getUserEmail());
			ckUserEmail.setMaxAge(3600);
			response.addCookie(ckUserEmail);
			Cookie ckUserPass=new Cookie("userPass",user.getUserPass());
			ckUserPass.setMaxAge(3600);
			response.addCookie(ckUserPass);
			
			return "redirect:/";
		}else{
			model.addAttribute("error","Account's Invalid");
			return "signin";
		}
		
		
	}
	
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String registerInContainer(HttpSession session,HttpServletRequest request){
		User user=checkCookie(request);
		if(user==null){
			
			return "register";
		}else{
			session.setAttribute("userEmail", user.getUserEmail());
			return "redirect:/";
		}
	}
	
	@ModelAttribute("user")
	public User addUserToModelAttribute(){
		return new User();
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST,params={"userEmail","userPass","password_confirm"})
	public String registerUser(@ModelAttribute User user,Model model){
		System.out.println(user);
		if(userService.addUser(user)){
			return "redirect:/user/signin";
		}else{
			model.addAttribute("error", "Registration Failed");
			System.out.println(user); 
			return "register";
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		session.removeAttribute("userEmail");
		Cookie[] cookies=request.getCookies();
		for(Cookie cookie:cookies){
			if(cookie.getName().equalsIgnoreCase("userEmail"))
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			if(cookie.getName().equalsIgnoreCase("userPass"))
				cookie.setMaxAge(0);
				response.addCookie(cookie);
		}
		
		return "redirect:/";
	}
	
	public User checkCookie(HttpServletRequest request){
		Cookie[] cookies=request.getCookies();
		User user=null;
		String userEmail="",userPass="";
		for(Cookie cookie : cookies){
			if(cookie.getName().equalsIgnoreCase("userEmail"))
				userEmail=cookie.getValue();
			if(cookie.getName().equalsIgnoreCase("userPass"))
				userPass=cookie.getValue();
		}
		if(!userEmail.isEmpty() && !userPass.isEmpty()){
			user=new User(userEmail,userPass);
		}
		return user;
	}
	
}
