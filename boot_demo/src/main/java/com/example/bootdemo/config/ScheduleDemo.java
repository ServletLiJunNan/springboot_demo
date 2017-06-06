package com.example.bootdemo.config;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * Created by lijunnan on 2017/5/23.
 */
@Service
public class ScheduleDemo{


    @Scheduled(fixedRate = 5000)
    public void add(){
        System.out.print("三刀木又");
    }
}
