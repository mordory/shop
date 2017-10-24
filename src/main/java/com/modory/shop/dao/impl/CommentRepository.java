package com.modory.shop.dao.impl;

import com.modory.shop.entity.Comment;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@EnableAutoConfiguration
public interface CommentRepository extends JpaRepository<Comment,Integer> {
    List<Comment> findByAid(int id);
}
