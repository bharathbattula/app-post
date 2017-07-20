package com.app.post.service;

import java.util.List;

import com.app.post.model.Post;

public interface PostService {


	public List<Post> findAllPosts();
	
	public void add(Post post);
	
	public void update(Post post);
	
	public void delete(Post post);
	
	public Post findPostById(String id);
}
