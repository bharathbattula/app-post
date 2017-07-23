package com.app.post.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.app.post.model.Post;

public class AddValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		System.out.println("AddValidators supports()");
		return Post.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) { 
			Post post = (Post) target;
			
			System.out.println("AddValidators validate()");
			if(post.getBody()==null || post.getBody().length()<5){
				errors.rejectValue("body", "post.body","Discription is must");
			}
	}

}
