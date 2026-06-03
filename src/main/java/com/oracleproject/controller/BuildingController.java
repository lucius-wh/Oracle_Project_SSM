package com.oracleproject.controller;

import com.oracleproject.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/building")
public class BuildingController {

    @Autowired
    private BuildingService buildingService;

    /**
     * 建筑详情
     */
    @GetMapping("/detail/{id}")
    public String detail(
            @PathVariable Integer id,
            Model model) {

        model.addAttribute(
                "building",
                buildingService.findById(id)
        );

        return "buildingDetail";
    }
}
