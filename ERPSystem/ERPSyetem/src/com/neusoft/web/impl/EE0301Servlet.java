package com.neusoft.web.impl;

import com.neusoft.web.impl.EE03ControllerSupport;

/**
 * @author 张学正
 * @description 学生宿舍入住控制器
 * @date 2019/07/16
 */
public class EE0301Servlet extends EE03ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.update("addLodging","入住信息导入");
        return "addLodging";
    }
}
