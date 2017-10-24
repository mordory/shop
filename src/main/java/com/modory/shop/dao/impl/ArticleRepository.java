package com.modory.shop.dao.impl;

import com.modory.shop.entity.Article;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
@EnableAutoConfiguration
public interface ArticleRepository extends JpaRepository<Article,Integer>{
    List<Article> getByDateAfter(Date date);
}
