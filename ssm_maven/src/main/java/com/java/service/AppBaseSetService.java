package com.java.service;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:45
 */
public interface AppBaseSetService {
    List<Map<String,Object>> findAdvices(Integer pageNum,Integer pageSize);

    /**
     * 批量处理
     * @param idStr
     * @return
     */
    boolean modifyMany(@Param("idStr") String idStr);

    /**
     * 修改单个意见反馈的状态
     * @param id
     */
    boolean modifyOne(Long id);

    /**
     * 获取关于我们
     * @return
     */
    Map<String,Object> findAbout();

    /**
     *
     * @return
     */
    boolean saveAbout(@Param("content") String content,@Param("id") Long id);
}
