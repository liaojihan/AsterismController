package com.guild.util;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * Created by LJH on 2017/11/14.
 */
public class Handle_Pic {

    public static String manage_pic (MultipartFile file, HttpServletRequest request,String search) throws IOException {
        //图片文件处理
        String realPath;
        String file_name [];
        String path;
        String check_path = null;
        if (file != null){
            file_name = file.getOriginalFilename().split("\\.");
            path= System.currentTimeMillis()+"."+file_name[1];
            switch (search) {
                case "person":
                    realPath = request.getServletContext().getRealPath("/image/person");
                    check_path = "image/person/" + path;
                    break;
                case "news":
                    realPath = request.getServletContext().getRealPath("/image/news");
                    check_path = "image/news/" + path;
                    break;
                default:
                    realPath = request.getServletContext().getRealPath("/image/boss");
                    check_path = "image/boss/" + path;
                    break;
            }
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath, path));
        }
        return check_path.replaceAll("\\\\", "/");
    }
}
