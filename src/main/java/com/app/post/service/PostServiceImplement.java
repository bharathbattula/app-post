package com.app.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.post.model.Post;
import com.app.post.repository.PostDao;
@Service
public class PostServiceImplement implements PostService {
	
	@Autowired
	PostDao postDao;
	
	@Override
	public List<Post> findAllPosts() {
		// TODO Auto-generated method stub
		return postDao.findAllPosts();
	}

	@Override
	public void add(Post post) {
		System.out.println("Post Service add method is invoked");
		postDao.add(post);
	}

	@Override
	public void update(Post post) {
		postDao.update(post);
	}

	@Override
	public void delete(Post post) {
		postDao.delete(post);
		
	}

	@Override
	public Post findPostById(String id) {
		
		return postDao.findPostById(id);
	}

}
