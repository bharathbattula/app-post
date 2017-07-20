package com.app.post.repository;

import com.app.post.model.User;

public interface UserDao {

	public boolean addUser(User user);
	
	public boolean checkForValidUser(User user);
	
	public User findUserById(String id);
}
