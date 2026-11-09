/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.jeecg.modules.sample.controller;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.aspect.annotation.AutoLog;
import org.jeecg.common.aspect.annotation.PermissionData;
import org.jeecg.common.constant.CommonConstant;
import org.jeecg.common.system.query.QueryGenerator;
import org.jeecg.modules.sample.entity.OhSampleBusinessComment;
import org.jeecg.modules.sample.service.IBusinessCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.DeleteMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * 商家评论
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Slf4j
@RestController
@RequestMapping("/sample/businessComment")
@Api(tags = "oh-sample仿商家评论")
public class BusinessCommentController {
    @Autowired
    private IBusinessCommentService commentService;

    /**
     * 分页列表查询
     *
     * @param comment 商家评论
     * @param pageNo 分页参数-页码
     * @param pageSize 分页参数-每页条数
     * @param req  HttpServletRequest
     * @return 评论列表
     */
    @ApiOperation(value = "评论列表", notes = "评论列表")
    @GetMapping(value = "/list")
    @PermissionData(pageComponent = "/list")
    @InterceptorIgnore(tenantLine = "true")
    public Result<?> list(OhSampleBusinessComment comment,
                          @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                          HttpServletRequest req) {
        QueryWrapper<OhSampleBusinessComment> queryWrapper =
                QueryGenerator.initQueryWrapper(comment, req.getParameterMap());
        queryWrapper.orderByDesc("create_time");
        Page<OhSampleBusinessComment> page = new Page<OhSampleBusinessComment>(pageNo, pageSize);

        IPage<OhSampleBusinessComment> pageList = commentService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 添加
     *
     * @param comment 评论
     * @return 添加结果
     */
    @PostMapping(value = "/add")
    @AutoLog(value = "评论添加")
    @ApiOperation(value = "评论添加", notes = "评论添加")
    public Result<?> add(@RequestBody OhSampleBusinessComment comment) {
        commentService.save(comment);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param comment 评论
     * @return 编辑结果
     */
    @AutoLog(value = "评论编辑", operateType = CommonConstant.OPERATE_TYPE_3)
    @ApiOperation(value = "评论编辑", notes = "评论编辑")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<?> edit(@RequestBody OhSampleBusinessComment comment) {
        commentService.updateById(comment);
        return Result.OK("更新成功！");
    }

    /**
     * 通过id删除
     *
     * @param id 评论id
     * @return 删除结果
     */
    @AutoLog(value = "评论删除")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除通过ID删除评论", notes = "删除通过ID删除评论")
    public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
        commentService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids 评论ids
     * @return 删除结果
     */
    @DeleteMapping(value = "/deleteBatch")
    @ApiOperation(value = "批量删除评论", notes = "批量删除评论")
    public Result<?> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        commentService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功！");
    }

}
