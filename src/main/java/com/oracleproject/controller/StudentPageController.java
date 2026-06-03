package com.oracleproject.controller;

import com.oracleproject.model.Student;
import com.oracleproject.service.AddService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * 页面跳转专用控制器（只做视图跳转、数据传递，不处理AJAX接口）
 * 和原有 RelController（接口控制器）职责分离，互不干扰
 */
@Controller  // 普通控制器，用于跳转页面（不是@RestController）
@RequestMapping("/student")
public class StudentPageController {

    @Autowired
    private AddService addService;

    /**
     * 跳转到【修改学生信息页面】并回显数据
     * @param sid 学生学号（从详情页/列表页传递）
     * @param request 请求域
     * @return JSP页面路径
     */
    @GetMapping("/toUpdatePage")
    public String toUpdateStudentPage(@RequestParam("sid") Integer sid,
                                      HttpServletRequest request){

        // 1. 基础校验学号
        if(sid == null || sid <= 0){
            // 学号非法，跳回列表/提示页（根据你项目自行修改路径）
            return "redirect:/studentList.jsp";
        }

        // 2. 根据学号查询学生（调用刚才新增的Service方法）
        Student student = addService.getStudentById(sid);

        // 3. 判断学生是否存在
        if(student == null){
            // 学生不存在，重定向回列表页
            return "redirect:/studentList.jsp";
        }

        // 4. 将学生对象存入 request 域（JSP 通过 EL ${student} 取值）
        request.setAttribute("student", student);

        // 5. 转发到 修改学生JSP页面（填写你实际的JSP文件名）
        // 例：你的修改页面叫 updateStudent.jsp，直接写文件名即可
        return "updateStudent";
    }
}
