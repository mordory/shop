package com.modory.shop.dao.impl;

import com.modory.shop.entity.User;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@EnableAutoConfiguration
public interface UserRepository extends JpaRepository<User,Integer>{

    public List<User> findByUsernameAndPassword(String username, String password);
}
