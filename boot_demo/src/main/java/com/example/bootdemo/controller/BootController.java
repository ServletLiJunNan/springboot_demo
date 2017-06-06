package com.example.bootdemo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by lijunnan on 2017/5/11.
 */
@RestController
public class BootController {

    @RequestMapping(value = "/demo")
    public String get(){
        return "shshhs";
    }
}
