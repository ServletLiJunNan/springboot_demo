package com.example.bootdemo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;

/**
 * Created by lijunnan on 2017/5/17.
 */
//@Configuration
//@EnableWebSecurity//声明使用security
//@EnableGlobalMethodSecurity(prePostEnabled = true)//在方法级别使用
public class WebSecurityConfig extends WebSecurityConfiguration{


}
