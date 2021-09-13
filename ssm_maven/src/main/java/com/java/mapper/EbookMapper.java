package com.java.mapper;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:50
 */
public interface EbookMapper {

    @Select("SELECT * FROM ebook_entry")
    List<Map<String,Object>> selectEBooks();

}
