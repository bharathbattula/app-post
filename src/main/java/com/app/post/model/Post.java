package com.app.post.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document
public class Post {
	
	@Field
	@Id
	private String id;
	
	@NotBlank
	@Field
	private String title;
	
	@Field
	private String date;
	
	@Field
	private String authorName;
	
	@NotBlank
	@Field
	private String body;

	public Post(){
		
	}
	public Post(String id,String title,String date,String authorName,String body){
		this.id=id;
		this.title=title;
		this.date=date;
		this.authorName=authorName;
		
		this.body=body;
	}
	
	public String getid() {
		return id;
	}

	public void setid(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", date=" + date + ", authorName=" + authorName + ", body="
				+ body + "]";
	}
	
	
}
