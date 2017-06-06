package com.example.bootdemo.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

/**
 * Created by lijunnan on 2017/5/23.
 */
@EnableScheduling
@Configuration
@ComponentScan("com.example")
public class SchedulConfig {
}
