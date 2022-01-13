package com.test.ssm.service;

import com.test.ssm.domain.Resume;

public interface ResumeService {

    /**
     * 查找简历
     */
    public Resume findResume(String userEmail);

    /**
     * 新增简历
     */
    public int addResume(Resume resume);

    /**
     * 修改简历
     */
    public int saveResume(Resume resume);
}
