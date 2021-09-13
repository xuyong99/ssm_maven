package com.java.pojo.admin;

import lombok.Data;

import java.io.Serializable;

/**
 * description：
 * author：丁鹏
 * date：16:43
 */
@Data
public class TwoMenu implements Serializable{
    private static final long serialVersionUID = -3552941396607097821L;
    private Long twoId;//二级id
    private String twoName;//二级菜单名
    private Long parentId;//父id
}
