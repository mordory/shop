package com.modory.shop.controller;

import com.modory.shop.dao.impl.ArticleRepository;
import com.modory.shop.dao.impl.CommentRepository;
import com.modory.shop.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping
public class ArticleController {

    @Autowired
    private ArticleRepository articleRepository;

    @Autowired
    private CommentRepository commentRepository;

    @GetMapping("list")
    public List<Article> AritcleLists()
    {
        return articleRepository.findAll();
    }

    @GetMapping
    public List<Article> CurrentList(@PathVariable("date")Date date)
    {
        return articleRepository.getByDateAfter(date);
    }

    @PostMapping("add")
    public Article add(Article article)
    {
        return articleRepository.save(article);
    }

    @PutMapping("modify")
    public void modify(@PathVariable("id") int id,
                       @RequestParam("title") String title,
                       @RequestParam("auther") String auther,
                       @RequestParam("date") Date date,
                       @RequestParam("design")File design,
                       @RequestParam("department") String department,
                       @RequestParam("content") String content,
                       @RequestParam("comment") String comment)
    {

        Article article=new Article();
        article.setId(id);
        article.setAuthor(auther);
        article.setTitle(title);
        article.setDate(date);
        article.setDesign(design);
        article.setDepartment(department);
        article.setContent(content);
        articleRepository.save(article);
    }

}
