package com.java.mapper;

import com.java.pojo.admin.OneMenu;
import com.java.pojo.admin.SystemUser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：16:47
 */
public interface AuthorityMapper {

    /**
     * 后台菜单获取
     * @param id
     * @return
     */
    @Select("SELECT sa.* FROM system_roles sr INNER JOIN system_role_authority sra\n" +
            "ON sr.id=sra.roleId INNER JOIN `system_authoriy` sa ON sa.id=sra.authorityId\n" +
            "INNER JOIN system_users su ON su.roleId=sra.roleId WHERE su.account=#{0}\n" +
            "AND sa.parentId=#{1}")
    List<Map<String,Object>> selectMenus(String account,Long id);

    /**
     * 登录
     * @param account
     * @param password
     * @return
     */
    @Select("SELECT COUNT(*) FROM system_users WHERE account=#{0} AND pwd=#{1} AND STATUS='1';")
    int selectByAccountAndPwd(String account,String password);

    /**
     * 获取角色列表
     * @return
     */
    @Select("SELECT * FROM `system_roles`")
    List<Map<String,Object>> selectRoles();

    /**
     * 获取可以授权的权限信息
     * @return
     */
    @Select("SELECT * FROM system_authoriy WHERE flag='0' AND parentId=#{0}")
    List<Map<String,Object>> selectRoleAuthority(Long id);

    /**
     * 判断指定的角色名是否存在
     * @param roleName
     * @return
     */
    @Select("SELECT COUNT(*) FROM system_roles WHERE roleName=#{roleName}")
    int selectRoleNameExists(String roleName);

    /**
     * 添加一条角色，并且返回主键值
     * @param paramMap
     * @return
     */
    @Insert("INSERT INTO system_roles VALUES(NULL,#{roleName},'1',NOW(),'0')")
    @Options(useGeneratedKeys = true,keyProperty = "roleId",keyColumn = "id")
    int insertRole(Map<String,Object> paramMap);

    /**
     * 插入角色和权限的映射关系
     * @param roleId
     * @param authorityAttr
     * @return
     */
    int insertRoleAuthorityRelation(@Param("roleId") Long roleId,@Param("authorityAttr") String[] authorityAttr);

    /**
     * 获取系统管理员
     * @return
     */
    @Select("SELECT * FROM system_users")
    List<Map<String,Object>> selectSystemUsers();

    /**
     * 获取普通角色
     * @return
     */
    @Select("SELECT * FROM system_roles WHERE isRoot='0'")
    List<Map<String,Object>> selectPTRoles();

    /**
     * 判断指定账号是否存在
     * @param account
     * @return
     */
    @Select("SELECT COUNT(*) FROM system_users WHERE account=#{0}")
    int selectAccountIsExist(String account);

    /**
     * 添加一条系统用户信息
     * @param user
     * @return
     */
    @Insert("INSERT INTO system_users VALUES(NULL,NULL,#{account1},#{phone1},#{email1},#{uName1},#{pwd1},#{status1},#{roleId1});")
    int insertSystemUser(SystemUser user);

    /**
     * 查询出所有的一级权限
     * @return
     */
    List<OneMenu> selectPTAuthority();
}
