package com.oracleproject.controller;

import com.oracleproject.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 学生详情
     */
    @GetMapping("/detail/{sid}")
    public String detail(
            @PathVariable Integer sid,
            Model model) {

        model.addAttribute(
                "student",
                studentService.findById(sid)
        );

        return "studentDetail";
    }

    /**
     * 删除学生
     */
    @GetMapping("/delete/{sid}")
    public String delete(
            @PathVariable Integer sid) {

        studentService.deleteStudent(sid);

        return "redirect:/visit/list";
    }
}
