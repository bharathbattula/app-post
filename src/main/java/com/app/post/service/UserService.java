package com.app.post.service;

import com.app.post.model.User;

public interface UserService {

	public boolean addUser(User user);
	
	public boolean checkForValidUser(User user);
	
	public User findUserById(String id);
}
