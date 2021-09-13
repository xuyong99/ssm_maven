package com.java.service;

import com.java.pojo.admin.OneMenu;
import com.java.pojo.admin.SystemUser;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：16:49
 */
public interface AuthorityService {
    List<Map<String,Object>> findMenus(String account,Long id);

    /**
     * 登录
     * @param account
     * @param password
     * @return
     */
    boolean findByAccountAndPwd(String account,String password);

    /**
     * 获取所有角色列表
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Map<String,Object>> findRoles(Integer pageNum,Integer pageSize);

    /**
     * 获取可以授权的权限信息
     * @return
     */
    List<Map<String,Object>> findRoleAuthority(Long id);



    /**
     * 添加角色
     * @param roleName
     * @param authorityIdStr
     * @return
     */
    Map<String,Object> saveRole(String roleName,String authorityIdStr);

    /**
     * 获取系统管理员
     * @return
     */
    List<Map<String,Object>> findSystemUsers(Integer pageNum,Integer pageSize);

    /**
     * 获取普通角色
     * @return
     */
    List<Map<String,Object>> findPTRoles();

    Map<String,Object> saveSystemUser(SystemUser user);

    /**
     * 查询出所有的一级权限
     * @return
     */
    List<OneMenu> findPTAuthority();
}
