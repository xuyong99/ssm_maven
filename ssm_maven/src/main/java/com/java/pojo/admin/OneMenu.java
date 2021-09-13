package com.java.pojo.admin;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * description：
 * author：丁鹏
 * date：16:43
 */
@Data
public class OneMenu implements Serializable{
    private static final long serialVersionUID = 1462469613775520594L;
    private Long oneId;//一级权限id
    private String oneName;//一级权限名
    private List<TwoMenu> twoMenuList;
}
