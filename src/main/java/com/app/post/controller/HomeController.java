package com.app.post.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.app.post.model.Post;
import com.app.post.service.PostService;

@Controller
public class HomeController {

	@Autowired
	PostService postService;
	
	@RequestMapping("/")
	public String goHome(Model model,HttpSession session){
		
		session.setAttribute("validUser", "");
		
		List<Post> posts=new LinkedList<>();
		posts=postService.findAllPosts();
		
		model.addAttribute("posts", posts);
		
		return "index";
	}
	
	
}
