package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.AuthorityMapper;
import com.java.pojo.admin.OneMenu;
import com.java.pojo.admin.SystemUser;
import com.java.service.AuthorityService;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：16:48
 */
@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    private AuthorityMapper authorityMapper;

    /**
     * 后台菜单获取
     * @param id
     * @return
     */
    @Override
    public List<Map<String,Object>> findMenus(String account,Long id){
        return authorityMapper.selectMenus(account,id);
    }

    @Override
    public boolean findByAccountAndPwd(String account, String password) {
        //校验account、password是否满足格式要求
        return authorityMapper.selectByAccountAndPwd(account,password)==1;
    }

    @Override
    public List<Map<String, Object>> findRoles(Integer pageNum, Integer pageSize) {
        //分页
        PageHelper.startPage(pageNum,pageSize);
        return authorityMapper.selectRoles();
    }

    @Override
    public List<Map<String, Object>> findRoleAuthority(Long id) {
        return authorityMapper.selectRoleAuthority(id);
    }

    @Override
    public Map<String, Object> saveRole(String roleName, String authorityIdStr) {
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("status","0");
        //status: 0成功,1失败，2角色名重复,3数据格式错误  -1未知错误
        //1、首先校验数据:roleName，字符长度1~10中文   authorityIdStr需要时数字  "1,2,3,"
        if(roleName==null || authorityIdStr==null){
            resultMap.put("status","3");
            return resultMap;
        }
        if(!roleName.matches("[\\u4e00-\\u9fa5]{1,10}") || !authorityIdStr.matches("(\\d+,)+")){
            resultMap.put("status","3");
            return resultMap;
        }
        //2、判断角色名是否存在
        int flag1 = authorityMapper.selectRoleNameExists(roleName);
        if(flag1==1){//存在
            resultMap.put("status","2");
            return resultMap;
        }
        //插入角色记录
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("roleName",roleName);
        int flag2 = authorityMapper.insertRole(paramMap);
        if(flag2==0){
            resultMap.put("status","1");
            return resultMap;
        }
        //插入角色与权限的关联关系
        Long roleId = (Long)paramMap.get("roleId");
        String[] authorityIdAttr = authorityIdStr.split("\\,");
        int flag3 = authorityMapper.insertRoleAuthorityRelation(roleId,authorityIdAttr);
        if(flag3==0){
            resultMap.put("status","-1");
            return resultMap;
        }
        return resultMap;
    }

    @Override
    public List<Map<String, Object>> findSystemUsers(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return authorityMapper.selectSystemUsers();
    }

    @Override
    public List<Map<String, Object>> findPTRoles() {
        return authorityMapper.selectPTRoles();
    }

    @Override
    public Map<String, Object> saveSystemUser(SystemUser user) {
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("status","0");//保存数据成功
        //判断给定的账号是否存在
        int i = authorityMapper.selectAccountIsExist(user.getAccount1());
        if(i==1){//数据存在
            resultMap.put("status","2");//账号已经存在
            return resultMap;
        }
        int flag = authorityMapper.insertSystemUser(user);
        if(flag==1){//保存成功
            return resultMap;
        }
        resultMap.put("status","1");
        return resultMap;
    }

    @Override
    public List<OneMenu> findPTAuthority() {
        return authorityMapper.selectPTAuthority();
    }

}
