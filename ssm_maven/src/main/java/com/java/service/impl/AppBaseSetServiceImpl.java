package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.AppBaseSetMapper;
import com.java.service.AppBaseSetService;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:44
 */
@Service
public class AppBaseSetServiceImpl implements AppBaseSetService {

    @Autowired
    private AppBaseSetMapper appBaseSetMapper;

    /**
     * 查询所有意见反馈-分页
     * @return
     */
   @Override
   public  List<Map<String,Object>> findAdvices(Integer pageNum,Integer pageSize){
       PageHelper.startPage(pageNum,pageSize);
       return appBaseSetMapper.selectAdvices();
   }

    @Override
    public boolean modifyMany(String idStr) {
       if(idStr==null || idStr=="")
           return false;
        //去掉idStr后面多余的","     idStr = "1,2,3,"
        idStr = idStr.substring(0,idStr.lastIndexOf(","));
        //判断idStr中是否是数字
        return appBaseSetMapper.updateMany(idStr)>=1;
    }

    @Override
    public boolean modifyOne(Long id) {
        try {
            appBaseSetMapper.updateOne(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Map<String, Object> findAbout() {
        return appBaseSetMapper.selectAbout();
    }

    @Override
    public boolean saveAbout(String content, Long id) {
       //数据校验
        return appBaseSetMapper.updateAbout(content,id)==1;
    }

}
