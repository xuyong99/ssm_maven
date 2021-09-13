package com.java.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:43
 */
public interface AppBaseSetMapper {

    /**
     * 查询所有意见反馈-分页
     * @return
     */
    @Select("SELECT sa.*,au.`uName` FROM system_advice sa INNER JOIN app_users au\n" +
            "ON sa.appUserId=au.id")
    List<Map<String,Object>> selectAdvices();

    /**
     * 批量处理
     * @param idStr
     * @return
     */
    @Update("UPDATE system_advice SET STATUS='1' WHERE id IN(${idStr})")
    int updateMany(@Param("idStr") String idStr);

    /**
     * 修改单个意见反馈的状态
     * @param id
     */
    void updateOne(@Param("id") Long id);

    /**
     * 获取关于我们
     * @return
     */
    @Select("SELECT * FROM app_notice WHERE `type`='1' ORDER BY updateTime DESC  LIMIT 1")
    Map<String,Object> selectAbout();

    /**
     *
     * @return
     */
    @Update("UPDATE app_notice SET content=#{content},updateTime=NOW() WHERE id=#{id}")
    int updateAbout(@Param("content") String content,@Param("id") Long id);

}
