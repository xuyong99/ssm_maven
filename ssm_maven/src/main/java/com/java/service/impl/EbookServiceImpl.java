package com.java.service.impl;

import com.java.mapper.EbookMapper;
import com.java.service.EbookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：14:51
 */
@Service
public class EbookServiceImpl implements EbookService {

    @Autowired
    private EbookMapper ebookMapper;

    @Override
    public List<Map<String, Object>> findEBooks() {
        return ebookMapper.selectEBooks();
    }

}
