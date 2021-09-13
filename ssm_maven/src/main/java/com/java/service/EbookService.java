package com.java.service;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:50
 */
public interface EbookService {
    List<Map<String,Object>> findEBooks();
}
