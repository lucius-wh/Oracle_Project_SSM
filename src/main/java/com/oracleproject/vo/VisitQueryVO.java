package com.oracleproject.vo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//Spring MVC 会自动做 参数绑定（Data Binding）只有有setter
public class VisitQueryVO {

    private String keyword;
    private String classname;
    private String areaCode;
    @DateTimeFormat(pattern = "yyyy-MM-dd")//把请求中的string变成date
    private Date visitTime;


    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public Date getVisitTime() {
        return visitTime;
    }

    public void setVisitTime(Date visitTime) {
        this.visitTime = visitTime;
    }
}
