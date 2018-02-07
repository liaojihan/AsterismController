package com.guild.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by LJH on 2017/12/4.
 */
public class Handle_Sort {

    public static int check_sort_parameter(HttpServletRequest request){
        int order_column;
        try {
            order_column = Integer.parseInt(request.getParameter("order[0][column]"));
        } catch (NumberFormatException e) {
            order_column = 0;
        }
        return order_column;
    }
}
