package com.app.post.repository;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.app.post.model.User;

@Repository
public class UserDaoImplement implements UserDao {
	@Autowired
	MongoTemplate mongoTemplate;
	
	private static final String COLLECTION_NAME="user";
	
	
	
	@Override
	public boolean addUser(User user) {
		
		if(!mongoTemplate.collectionExists(COLLECTION_NAME)){
			mongoTemplate.createCollection(COLLECTION_NAME);
		}
		Query query =new Query();
		query.addCriteria(Criteria.where("userEmail").is(user.getUserEmail()));
		if(mongoTemplate.findOne(query,User.class)==null){
			user.setId(UUID.randomUUID().toString());
			mongoTemplate.insert(user, COLLECTION_NAME);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean checkForValidUser(User user) {
		
		Query query=new Query();
		query.addCriteria(Criteria.where("userEmail").is(user.getUserEmail()).andOperator(Criteria.where("userPass").is(user.getUserPass())));
				
		//uery.addCriteria(Criteria.where("emailId").is(user.getEmailId()).andOperator(Criteria.where("password").is(user.getPassword())));
		long count=mongoTemplate.count(query, User.class);
		if(count>0){
			return true;
		}else{
			return false;
		}
		
		
	}
	
	@Override
	public User findUserById(String id) {
		
		return null;
	}

}
