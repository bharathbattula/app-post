package com.app.post.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.app.post.model.Post;
import com.app.post.model.User;
import com.app.post.service.PostService;
import com.app.post.service.UserService;
import com.app.post.validators.AddValidator;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	PostService postService;
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addPost(Model model, HttpSession session){
	
		
		
		if(session.getAttribute("userEmail")==null){
			return "redirect:/user/signin";
		}else{
			model.addAttribute("post",new Post());
			return "add_post";
		}
	
	}
	
	

	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String save(@Valid @ModelAttribute Post post,HttpSession session,Errors errors){
			if(!errors.hasErrors()){
				System.out.println("Validation success");
			}else{
				System.out.println("Validation un-success");
				return "add_post";
			}
			System.out.println(post);
			if(post.getAuthorName()==null){
				post.setAuthorName((String) session.getAttribute("userEmail"));
			}
			
			postService.add(post);
			System.out.println(post.getid());
			System.out.println(post);
			
		return "redirect:/";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.addValidators(new AddValidator());
	}

	
	@RequestMapping(value="/view/{id}")
	public String findSpecificPost(Model model,@PathVariable String id){
		model.addAttribute("post", this.postService.findPostById(id));
		return "post";
	}
	
}
