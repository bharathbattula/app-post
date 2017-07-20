package com.app.post.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document
public class User {
	
	@Id
	@Field
	private String id;
	
	@Field
	private String userEmail;
	
	@Field
	private String userPass;
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userEmail=" + userEmail + ", userPass=" + userPass + "]";
	}

	public User(String userEmail, String userPass) {
		super();
		
		this.userEmail = userEmail;
		this.userPass = userPass;
	}

	public User(){
		
	}
	
	
	
}
