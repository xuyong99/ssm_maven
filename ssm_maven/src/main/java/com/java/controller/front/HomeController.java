package com.java.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * description：
 * author：丁鹏
 * date：14:21
 */
@Controller
@RequestMapping("/home")
public class HomeController {

    @RequestMapping("/test")
    @ResponseBody
    public String test(){
        return "hello sssm";
    }

}
