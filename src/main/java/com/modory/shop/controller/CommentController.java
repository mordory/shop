package com.modory.shop.controller;

import com.modory.shop.dao.impl.CommentRepository;
import com.modory.shop.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "comment")
public class CommentController {
    private CommentRepository commentRepository;

    @Autowired
    public CommentController(CommentRepository commentRepository) {
        this.commentRepository=commentRepository;
    }

    @GetMapping("list")
    public List<Comment> CommentList(@PathVariable("id")Integer id)
    {
        return commentRepository.findByAid(id);
    }


}
