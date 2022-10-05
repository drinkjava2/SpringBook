package com.didispace.web;

import com.didispace.dto.User;
import com.didispace.service.Hello456Service;
import org.springframework.web.bind.annotation.*;

@RestController
public class RefactorHello456Controller implements Hello456Service {

	@Override
	public String hello(@RequestParam("name") String name) {
		return "Hello " + name;
	}

	@Override
	public User hello(@RequestHeader("name") String name, @RequestHeader("age") Integer age) {
		return new User(name, age);
	}

	@Override
	public String hello(@RequestBody User user) {
		return "Hello "+ user.getName() + ", " + user.getAge();
	}

}