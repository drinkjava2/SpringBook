package com.didispace.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.metrics.CounterService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @Autowired
    private CounterService myCounterService;
    
	@RequestMapping("/hello")
	public String index() {
	    myCounterService.increment("my.helloCount");
		return "Hello World";
	}

}