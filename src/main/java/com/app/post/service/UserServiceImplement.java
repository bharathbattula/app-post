package com.app.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.post.model.User;
import com.app.post.repository.UserDao;


@Service
public class UserServiceImplement implements UserService{

	@Autowired
	UserDao userDao;
	
	@Override
	public boolean addUser(User user) {
		
		return userDao.addUser(user) ;
	}

	@Override
	public boolean checkForValidUser(User user) {
		// TODO Auto-generated method stub
		return userDao.checkForValidUser(user);
	}

	@Override
	public User findUserById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
