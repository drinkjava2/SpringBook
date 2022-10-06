package com.didispace.web;

import org.springframework.cloud.netflix.feign.FeignClient;

@FeignClient(value = "HELLO-SERVICE")
public interface RefactorHello456Service extends com.didispace.service.Hello456Service {


}