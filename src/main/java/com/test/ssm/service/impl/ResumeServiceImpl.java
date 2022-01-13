package com.test.ssm.service.impl;

import com.test.ssm.dao.ResumeDao;
import com.test.ssm.domain.Resume;
import com.test.ssm.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author ：Arisa
 * @description：TODO
 * @date ：2022/1/7 10:30
 */
@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private ResumeDao resumeDao;
    /**
     * 查找简历
     */
    public Resume findResume(String userEmail){
        return resumeDao.selectResume(userEmail);
    }

    /**
     * 新增简历
     */
    public int addResume(Resume resume){
        return resumeDao.insertResume(resume);
    }

    /**
     * 修改简历
     */
    public int saveResume(Resume resume){
        return resumeDao.updateResume(resume);
    }
}
