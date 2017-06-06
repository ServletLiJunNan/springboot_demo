package com.example.bootdemo.controller;

import com.example.bootdemo.entity.User;
import com.example.bootdemo.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by lijunnan on 2017/5/22.
 */
@RestController
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * save use before findName
     * @return
     */
    @RequestMapping(path = "/save-user",method = RequestMethod.GET)
    public String save() {
        User user = new User(2, "Tseng", 21);
        mongoTemplate.save(user);
        //也可以使用Repository插入数据，userService.save(user);
        Gson gson=new Gson();
        gson.toJson(user);
        return gson.toString();
    }

    @RequestMapping(path = "/find-user",method = RequestMethod.GET)
    public String find() {
        List<User> userList = mongoTemplate.findAll(User.class);
        Gson gson=new Gson();
        gson.toJson(userList);
        return gson.toString();
    }

    /**
     * input String name "Tseng"
     * @param name
     * @return
     */
    @RequestMapping(path = "/findByName-user",method = RequestMethod.GET)
    public String findByName(@RequestParam("name") String name) {
        User user = userService.findByName(name);
        Gson gson=new Gson();
        gson.toJson(user);
        return gson.toString();
    }
}
