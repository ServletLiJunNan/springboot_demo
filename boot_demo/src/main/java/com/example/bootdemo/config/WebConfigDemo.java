package com.example.bootdemo.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.mapping.Document;

import java.lang.annotation.*;

/**
 *
 * 自定义注解
 * 可以由元注解组成
 * Created by lijunnan on 2017/5/23.
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Configuration
@ComponentScan
public @interface WebConfigDemo {
}
