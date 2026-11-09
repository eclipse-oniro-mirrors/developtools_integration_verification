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
import org.jeecg.modules.sample.entity.OhSampleShortVideo;
import org.jeecg.modules.sample.service.IVideoService;
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
 * 短视频应用
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Slf4j
@RestController
@RequestMapping("/sample/video")
@Api(tags = "oh-sample短视频应用")
public class VideoController {

    @Autowired
    private IVideoService videoService;

    /**
     * 分页列表查询
     *
     * @param video    视频实体类
     * @param pageNo   分页参数-页码
     * @param pageSize 分页参数-每页条数
     * @param req      HttpServletRequest
     * @return 视频列表
     */
    @ApiOperation(value = "视频列表", notes = "视频列表")
    @GetMapping(value = "/list")
    @PermissionData(pageComponent = "/list")
    public Result<?> list(OhSampleShortVideo video,
                          @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                          HttpServletRequest req) {
        QueryWrapper<OhSampleShortVideo> queryWrapper = QueryGenerator.initQueryWrapper(video, req.getParameterMap());
        queryWrapper.orderByDesc("create_time");
        Page<OhSampleShortVideo> page = new Page<OhSampleShortVideo>(pageNo, pageSize);
        IPage<OhSampleShortVideo> pageList = videoService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 添加
     *
     * @param video 视频实体类
     * @return 添加结果
     */
    @PostMapping(value = "/add")
    @AutoLog(value = "视频添加")
    @ApiOperation(value = "视频添加", notes = "视频添加")
    public Result<?> add(@RequestBody OhSampleShortVideo video) {
        videoService.save(video);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param video 视频实体类
     * @return 编辑结果
     */
    @AutoLog(value = "视频编辑", operateType = CommonConstant.OPERATE_TYPE_3)
    @ApiOperation(value = "视频编辑", notes = "视频编辑")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<?> edit(@RequestBody OhSampleShortVideo video) {
        videoService.updateById(video);
        return Result.OK("更新成功！");
    }

    /**
     * 通过id删除
     *
     * @param id 视频id
     * @return 删除结果
     */
    @AutoLog(value = "视频删除")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除通过ID删除视频", notes = "删除通过ID删除视频")
    public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
        videoService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids 视频id集合
     * @return 删除结果
     */
    @DeleteMapping(value = "/deleteBatch")
    @ApiOperation(value = "批量删除视频", notes = "批量删除视频")
    public Result<?> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        videoService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功！");
    }

}
