package com.guild.model;

/**
 * Created by LJH on 2017/11/13.
 */
public class News {
    private int id;//新闻ID
    private String title;//标题
    private String release_time;//发布时间
    private String source;//来源
    private String content;//内容
    private String header_pic_path;//新闻头图片

    public String getHeader_pic_path() {
        return header_pic_path;
    }

    public void setHeader_pic_path(String header_pic_path) {
        this.header_pic_path = header_pic_path;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRelease_time() {
        return release_time;
    }

    public void setRelease_time(String release_time) {
        this.release_time = release_time;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
