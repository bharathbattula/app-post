package com.app.post.repository;

import java.util.List;

import com.app.post.model.Post;

public interface PostDao {

	public List<Post> findAllPosts();
	
	public void add(Post post);
	
	public void update(Post post);
	
	public void delete(Post post);
	
	public Post findPostById(String id);
}
