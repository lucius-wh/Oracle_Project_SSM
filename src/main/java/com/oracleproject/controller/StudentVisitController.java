package com.oracleproject.controller;

import com.oracleproject.service.StudentVisitService;
import com.oracleproject.vo.VisitQueryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/visit")
public class StudentVisitController {

    @Autowired
    private StudentVisitService studentVisitService;

    /**
     * queryVO存放前端请求的数据
     * model存放数据控中查到的数据，jsp可以直接用
     * 主页面 + 模糊查询
     */
    @GetMapping("/list")
    public String list(
            VisitQueryVO queryVO,
            Model model) {
        //System.out.println(queryVO.getAreaCode());
        model.addAttribute(
                "visitList",
                studentVisitService.findVisitList(queryVO)
        );

        return "studentVisitList";
    }

    /**
     * 删除参观记录（逻辑删除）
     */
    @GetMapping("/deleteRel/{relId}")
    public String deleteRel(
            @PathVariable Integer relId) {

        studentVisitService.deleteRel(relId);

        return "redirect:/visit/list";
    }

}
