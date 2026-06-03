package com.oracleproject.controller;

import com.oracleproject.mapper.AddMapper;
import com.oracleproject.model.Student;
import com.oracleproject.service.AddService;
import com.oracleproject.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/student")
public class AddController {

    @Autowired
    private AddService addService;

    @Autowired
    private AddMapper addMapper;

    @PostMapping("/add")
    public Result addStudent(@RequestBody(required = false) Student student) {

        try {
            if (student == null) {
                return Result.error("参数解析失败，student为null");
            }
            boolean success;
            // 恢复 Service 调用
            if(addMapper.selectStudentByIdAll(student.getSid())!=null)
            {
                student.setIsDelete(0);
                success = addService.updateStudent(student);
                if (success) {
                    return Result.success("学生新增成功");
                } else {
                    return Result.error("学生新增失败");
                }
            }else{
                success = addService.addStudent(student);
                if (success) {
                    return Result.success("学生新增成功");
                } else {
                    return Result.error("学生新增失败");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("服务器异常：" + e.getMessage());
        }
    }

}
