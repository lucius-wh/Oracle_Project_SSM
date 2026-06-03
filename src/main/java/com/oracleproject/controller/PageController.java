package com.oracleproject.controller;

import com.oracleproject.model.Building;
import com.oracleproject.service.PageService;
import com.oracleproject.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/building")
public class PageController {
    @Autowired
    private PageService pageService;

    @GetMapping("/page")
    public String getBuildingPage(@RequestParam(defaultValue = "1") Integer pageNum, Model model) {
        PageBean<Building> pageBean = pageService.getBuildingPage(pageNum);
        model.addAttribute("pageBean", pageBean);

        /*List<Building> deletedBuildings = pageService.getAllDeletedBuildings();*/
        List<Building> deletedList = pageService.getAllDeletedBuildings();

        // 3. 新增判断：是否是正常数据的最后一页
        boolean isLastPage = pageNum.equals(pageBean.getPages());

        // 4. 控制删除数据的传递：只有最后一页才传给前端，其他页传空列表
        if (isLastPage) {
            model.addAttribute("deletedList", deletedList);
        } else {
            model.addAttribute("deletedList", new ArrayList<>()); // 非最后一页传空，不渲染
        }

        // 5. 传递标记：方便前端控制显示
        model.addAttribute("isLastPage", isLastPage);

        /*model.addAttribute("deletedList", deletedBuildings);*/
        return "page";
    }

    @GetMapping("/delete")
    public String deleteBuilding(
            @RequestParam("id") Integer id) {
        // 调用Service执行逻辑删除
        pageService.deleteBuilding(id);
        // 删除成功后，重定向回分页页面（默认回到第1页，如需保留当前页可传pageNum参数）
        return "redirect:/building/page";
    }

    @GetMapping("/restore")
    public String restoreBuilding(@RequestParam("id") Integer id) {
        pageService.restoreBuilding(id);
        // 恢复成功后跳回当前分页
        return "redirect:/building/page";
    }
}
