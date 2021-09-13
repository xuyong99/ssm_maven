package com.java.controller.admin;

import com.github.pagehelper.PageInfo;
import com.java.pojo.admin.OneMenu;
import com.java.pojo.admin.SystemUser;
import com.java.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：16:50
 */
@Controller
@RequestMapping("/admin/authority")
public class AuthorityController {

    @Autowired
    private AuthorityService authorityService;

    /**
     * 获取后台管理平台的权限
     * @param id
     * @return
     */
    @RequestMapping("/getMenus")
    public @ResponseBody  List<Map<String,Object>> getMenus(@RequestParam(defaultValue = "0") Long id,HttpSession session){
        String account = (String) session.getAttribute("account");
        return authorityService.findMenus(account,id);
    }

    /**
     * 登录
     * @param account
     * @param password
     * @return
     */
    @RequestMapping("/login")
    public String login(String account, String password, HttpSession session){
        String base = "redirect:/pages/admin/";
        boolean flag = authorityService.findByAccountAndPwd(account,password);
        if(flag){
            session.setAttribute("account",account);
            return base+"main.jsp";
        }
        return base+"login.jsp";
    }

    /**
     * 获取分页角色数据
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getRole")
    public @ResponseBody Map<String,Object> getRole(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer rows){
        List<Map<String, Object>> roleList = authorityService.findRoles(page, rows);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(roleList);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("rows",pageInfo.getList());
        resultMap.put("total",pageInfo.getTotal());
        return resultMap;
    }

    /**
     * 获取角色权限(不包括超级权限)
     * @param id
     * @return
     */
    @RequestMapping("/getRoleAuthority")
    public @ResponseBody List<Map<String,Object>> getRoleAuthority(@RequestParam(defaultValue = "0") Long id){
        return authorityService.findRoleAuthority(id);
    }

    /**
     * 添加角色信息
     * @param roleName
     * @param authorityIdStr
     * @return
     */
    @RequestMapping("/addRole")
    public @ResponseBody Map<String,Object> addRole(String roleName,String authorityIdStr){
        return authorityService.saveRole(roleName,authorityIdStr);
    }

    /**
     * 分页查询系统管理员信息
     * @return
     */
    @RequestMapping("/getSystemUser")
    public @ResponseBody Map<String,Object> getSystemUser(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer rows){
        List<Map<String, Object>> roleList = authorityService.findSystemUsers(page,rows);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(roleList);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("rows",pageInfo.getList());
        resultMap.put("total",pageInfo.getTotal());
        return resultMap;
    }

    /**
     * 获取所有普通角色
     * @return
     */
    @RequestMapping("/getPTRoles")
    public @ResponseBody List<Map<String,Object>> getPTRoles(){
        return authorityService.findPTRoles();
    }

    /**
     * 添加系统用户
     * @param user
     * @return
     */
    @RequestMapping("/addSystemUser")
    public @ResponseBody Map<String,Object> addSystemUser(SystemUser user){
        System.out.println("user="+user);
        return authorityService.saveSystemUser(user);
    }

    /**
     * 查询出所有的一级权限
     * @return
     */
    @RequestMapping("/getPTAuthority")
    public  String getPTAuthority(Model model){
        List<OneMenu> ptAuthorityList = authorityService.findPTAuthority();
        model.addAttribute("ptAuthorityList",ptAuthorityList);
        return "admin/systemManager/editRoleContent.jsp";
    }

}
