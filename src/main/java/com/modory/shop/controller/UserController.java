package com.modory.shop.controller;

import com.modory.shop.dao.impl.UserRepository;
import com.modory.shop.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("list")

    public List<User> UserList()
    {
        return userRepository.findAll();
    }


    @PostMapping("add")
    public User add(@RequestParam ("name") String username,@RequestParam("password") String password)
    {
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);

        return userRepository.save(user);
    }

    @GetMapping("get/{id}")
    public User get(@PathVariable("id") int id)
    {
        return userRepository.findOne(id);
    }

    @PutMapping("update")
    public User userUpdate(@PathVariable("id") int id,
                           @RequestParam("name") String username,
                           @RequestParam("password") String password,
                           @RequestParam("email") String email)
    {
        User user=new User(username,password,email);
        user.setUid(id);
        return userRepository.save(user);
    }


    @DeleteMapping("delete")
    public void userDelete(@PathVariable("id") int id)
    {
        userRepository.delete(id);
    }

    @RequestMapping("login")
    public String get(@RequestParam(required = false)String username,
                          @RequestParam(required = false) String password,HttpServletResponse response)
    {

        System.out.println(username+password);
        List<User> list=userRepository.findByUsernameAndPassword(username, password);
        Cookie cookie = new Cookie("userCookie","list");
        response.addCookie(cookie);

        return "Login success!";
    }

}
