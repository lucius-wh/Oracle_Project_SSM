package com.oracleproject.controller;

import com.oracleproject.model.Student;
import com.oracleproject.model.StudentBuildingRel;
import com.oracleproject.service.AddService;
import com.oracleproject.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rel")
public class RelController {

    @Autowired
    private AddService addService;

    /**
     * 新增学生-建筑参观记录
     * @param rel 前端传过来的JSON
     * @return Result 统一格式
     */
    @PostMapping("/add")
    public Result addRel(@RequestBody StudentBuildingRel rel) {
        System.out.println("=== 收到关联新增请求 ===");
        System.out.println("参数：" + rel);

        try {
            // 1. 校验学生ID是否存在
            boolean studentExists = addService.isStudentExists(rel.getSid());
            if (!studentExists) {
                return Result.error("学生不存在，请先添加学生");
            }

            // 2. 校验建筑ID是否在1-103之间
            Integer buildId = rel.getBuildId();
            if (buildId == null || buildId < 1 || buildId > 103) {
                return Result.error("建筑ID必须在1-103之间");
            }

            // 3. 插入关联记录
            boolean success = addService.addStudentBuildingRel(rel);
            if (success) {
                return Result.success("关联记录新增成功");
            } else {
                return Result.error("关联记录新增失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("服务器异常：" + e.getMessage());
        }
    }

    @PostMapping("/update")
    public Result updateRel(@RequestBody StudentBuildingRel rel) {
        // 1. 校验学号是否存在
        if (!addService.isStudentExists(rel.getSid())) {
            return Result.error("该学号不存在！");
        }

        // 2. 校验古建ID 1-103
        if (rel.getBuildId() < 1 || rel.getBuildId() > 103) {
            return Result.error("古建ID必须在1-103之间！");
        }

        // 3. 执行修改
        boolean success = addService.updateRel(rel);
        return success ? Result.success("修改成功！") : Result.error("修改失败！");
    }

    @PostMapping("/updateStudent")
    public Result updateStudent(@RequestBody Student student) {
        try {
            // 1. 校验学号是否有效
            if (student == null || student.getSid() <= 0) {
                return Result.error("无效的学号！");
            }

            // 2. 校验学生是否存在
            boolean exists = addService.isStudentExists(student.getSid());
            System.out.println("数据库查询学生是否存在：" + exists);
            if (!exists) {
                return Result.error("该学生不存在！");
            }

            // 3. 执行修改
            boolean success = addService.updateStudent(student);
            System.out.println("修改是否成功：" + success);
            return success ? Result.success("修改成功！") : Result.error("修改失败！");

        } catch (Exception e) {
            System.out.println("===== 服务器异常 =====");
            e.printStackTrace();
            return Result.error("服务器错误：" + e.getMessage());
        }
    }

}
