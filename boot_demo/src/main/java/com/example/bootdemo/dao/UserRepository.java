package com.example.bootdemo.dao;

import com.example.bootdemo.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Created by lijunnan on 2017/5/22.
 */
public interface UserRepository extends MongoRepository<User, String> {

    User findByName(String name);
}

