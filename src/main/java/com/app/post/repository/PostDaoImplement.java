package com.app.post.repository;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.app.post.model.Post;

@Repository
public class PostDaoImplement implements PostDao {
	
	@Autowired
	MongoTemplate mongoTemplate;
	
	private static final String COLLECTION_NAME="post";
	
	@Override
	public List<Post> findAllPosts() {
		
		return mongoTemplate.findAll(Post.class, COLLECTION_NAME);
	}

	@Override
	public void add(Post post) {
		
		System.out.println("PostDao add method is invoked");
		if(!mongoTemplate.collectionExists(COLLECTION_NAME)){
			mongoTemplate.createCollection(COLLECTION_NAME);
			}
		System.out.println("PostDao after if statement");
		post.setDate(new Date().toString());
		post.setid(UUID.randomUUID().toString());
		mongoTemplate.insert(post, COLLECTION_NAME);;
		System.out.println("After PostDao mongo operation");
	}

	@Override
	public void update(Post post) {
		mongoTemplate.save(post);
		
	}

	@Override
	public void delete(Post post) {
		mongoTemplate.remove(post,COLLECTION_NAME);
		
	}

	@Override
	public Post findPostById(String id) {
		
		return mongoTemplate.findById(id,Post.class,COLLECTION_NAME);
	}
	
}
