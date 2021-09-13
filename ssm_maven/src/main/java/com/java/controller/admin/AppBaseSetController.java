package com.java.controller.admin;

import com.github.pagehelper.PageInfo;
import com.java.service.AppBaseSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:46
 */
@Controller
@RequestMapping("/admin/appBaseSet")
public class AppBaseSetController {

    @Autowired
    private AppBaseSetService appBaseSetService;

    /**
     * 获取意见反馈信息---分页
     * @return
     */
    @RequestMapping("/getAdvices")
    public @ResponseBody Map<String,Object> getAdvices(@RequestParam(defaultValue = "1") Integer page,
                                                              @RequestParam(defaultValue = "10") Integer rows){
        System.out.println("page="+page+",rows="+rows);
        List<Map<String, Object>> adviceList = appBaseSetService.findAdvices(page, rows);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(adviceList);
        Map<String,Object> resultMap = new HashMap<>();
        //封装总记录数
        resultMap.put("total",pageInfo.getTotal());
        resultMap.put("rows",pageInfo.getList());
        return resultMap;//总共有2条数据，1条
    }

    /**
     * 批量修改
     * @param idStr
     * @return
     */
    @RequestMapping("/batchUpdate.do")
    public @ResponseBody boolean batchUpdate(String idStr){
        return appBaseSetService.modifyMany(idStr);
    }

    /**
     * 修改单个意见反馈的状态
     * @param id
     * @return
     */
    @RequestMapping("/oneUpdate")
    public @ResponseBody boolean oneUpdate(Long id){
        return appBaseSetService.modifyOne(id);
    }

    /**
     * 跳转到关于我们页面
     * @return
     */
    @RequestMapping("/toAbout")
    public String toAbout(Model model){
        //调用业务层获取"关于我们"
        Map<String, Object> aboutMap = appBaseSetService.findAbout();
        model.addAttribute("aboutMap",aboutMap);
        return "admin/appBaseSet/about.jsp";
    }

    /**
     * 修改关于我们
     * @return
     */
    @RequestMapping("/updateAbout")
    public @ResponseBody boolean updateAbout(String content,Long id){
        return appBaseSetService.saveAbout(content,id);
    }

}
