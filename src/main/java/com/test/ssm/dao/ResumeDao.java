package com.test.ssm.dao;

import com.test.ssm.domain.Resume;

public interface ResumeDao {

    /**
     * 查询简历
     */
    Resume selectResume(String userEmail);

    /**
     * 新增简历
     */
    int insertResume(Resume resume);

    /**
     * 修改简历
     */
    int updateResume(Resume resume);
}
