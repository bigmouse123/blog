package com.jiankun.blog.service;

import com.jiankun.blog.pojo.Blog;
import com.jiankun.blog.pojo.vo.BlogVO;
import com.jiankun.blog.query.BlogQuery;
import com.jiankun.blog.utils.PageResult;

/**
 * @author OfferKing
 * @version 1.0
 * @date 2025/2/17 21:58
 */
public interface IBlogService {
    PageResult<BlogVO> selectByPage(BlogQuery blogQuery);

    void add(Blog blog);

    Blog selectById(String id);

    void update(Blog blog);
}
