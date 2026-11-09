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
import org.jeecg.modules.sample.entity.OhSampleBusinessGoods;
import org.jeecg.modules.sample.service.IBusinessGoodsService;
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
 * 商家商品
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Slf4j
@RestController
@RequestMapping("/sample/businessGoods")
@Api(tags = "oh-sample仿商家商品")
public class BusinessGoodsController {
    @Autowired
    private IBusinessGoodsService mtBusinessService;

    /**
     * 分页列表查询
     *
     * @param mtBusiness 商品
     * @param pageNo     分页参数-页码
     * @param pageSize   分页参数-每页条数
     * @param req        HttpServletRequest
     * @return 商品列表
     */
    @ApiOperation(value = "商品列表", notes = "商品列表")
    @GetMapping(value = "/list")
    @PermissionData(pageComponent = "/list")
    @InterceptorIgnore(tenantLine = "true")
    public Result<?> list(OhSampleBusinessGoods mtBusiness,
                          @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                          HttpServletRequest req) {
        QueryWrapper<OhSampleBusinessGoods> queryWrapper = QueryGenerator.initQueryWrapper(mtBusiness,
                req.getParameterMap());
        queryWrapper.orderByDesc("create_time");
        Page<OhSampleBusinessGoods> page = new Page<OhSampleBusinessGoods>(pageNo, pageSize);

        IPage<OhSampleBusinessGoods> pageList = mtBusinessService.page(page, queryWrapper);
        return Result.OK(pageList);
    }

    /**
     * 详情
     *
     * @param id 商品id
     * @return 商品详情
     */
    @GetMapping(value = "/detail")
    @AutoLog(value = "商品详情")
    @ApiOperation(value = "商品详情", notes = "商品详情")
    public Result<?> detail(@RequestParam(name = "id") String id) {
        OhSampleBusinessGoods goods = mtBusinessService.getById(id);
        return Result.OK(goods);
    }

    /**
     * 添加
     *
     * @param goods 商品
     * @return 添加结果
     */
    @PostMapping(value = "/add")
    @AutoLog(value = "商品添加")
    @ApiOperation(value = "商品添加", notes = "商品添加")
    public Result<?> add(@RequestBody OhSampleBusinessGoods goods) {
        mtBusinessService.save(goods);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param goods 商品
     * @return 编辑结果
     */
    @AutoLog(value = "商品编辑", operateType = CommonConstant.OPERATE_TYPE_3)
    @ApiOperation(value = "商品编辑", notes = "商品编辑")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<?> edit(@RequestBody OhSampleBusinessGoods goods) {
        mtBusinessService.updateById(goods);
        return Result.OK("更新成功！");
    }

    /**
     * 通过id删除
     *
     * @param id 商品id
     * @return 删除结果
     */
    @AutoLog(value = "商品删除")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除通过ID删除商品", notes = "删除通过ID删除商品")
    public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
        mtBusinessService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids 商品ids
     * @return 删除结果
     */
    @DeleteMapping(value = "/deleteBatch")
    @ApiOperation(value = "批量删除商品", notes = "批量删除商品")
    public Result<?> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        mtBusinessService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功！");
    }

}
