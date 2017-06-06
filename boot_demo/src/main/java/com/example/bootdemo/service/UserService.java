package com.example.bootdemo.service;

import com.example.bootdemo.dao.UserRepository;
import com.example.bootdemo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lijunnan on 2017/5/22.
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void save(User user) {
        userRepository.save(user);
    }

    public User findByName(String name) {
        return this.userRepository.findByName(name);
    }
}
