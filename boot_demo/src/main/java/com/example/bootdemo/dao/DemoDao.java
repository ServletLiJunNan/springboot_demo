package com.example.bootdemo.dao;

import com.example.bootdemo.entity.Demo;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by lijunnan on 2017/5/12.
 */
public interface DemoDao extends MongoRepository<Demo, String> {
    Demo findByName(String name);
}
