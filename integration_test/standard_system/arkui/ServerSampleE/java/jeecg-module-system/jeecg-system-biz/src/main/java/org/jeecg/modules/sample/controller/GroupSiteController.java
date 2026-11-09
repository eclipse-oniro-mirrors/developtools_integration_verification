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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.math3.util.Precision;
import org.jeecg.common.api.vo.Result;
import org.jeecg.common.aspect.annotation.AutoLog;
import org.jeecg.common.aspect.annotation.PermissionData;
import org.jeecg.common.constant.CommonConstant;
import org.jeecg.common.util.oConvertUtils;
import org.jeecg.modules.sample.entity.OhSampleGroupSite;
import org.jeecg.modules.sample.service.IGroupSiteService;
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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * 站点
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Slf4j
@RestController
@RequestMapping("/sample/groupSite")
@Api(tags = "oh-sample仿站点")
public class GroupSiteController {
    private final double earthRadius = 6371d; // 地球平均半径，单位为千米

    @Autowired
    private IGroupSiteService siteService;

    /**
     * 根据经纬度计算距离
     *
     * @param lat1 第一点的纬度坐标
     * @param lng1 第一点的经度坐标
     * @param lat2 第二点的纬度坐标
     * @param lng2 第二点的经度坐标
     * @return 两点之间的距离，单位为千米
     */
    private double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
        double radLat1 = Math.toRadians(lat1);
        double radLat2 = Math.toRadians(lat2);
        double a = radLat1 - radLat2;
        double b = Math.toRadians(lng1) - Math.toRadians(lng2);
        double s = 2d * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
                Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * earthRadius;
        s = Precision.round(s, 2); // 保留两位小数
        return s;
    }

    /**
     * 分页列表查询
     *
     * @param site 站点
     * @param pageNo 分页参数-页码
     * @param pageSize 分页参数-每页条数
     * @param req HttpServletRequest
     * @return 站点列表
     */
    @ApiOperation(value = "站点列表", notes = "站点列表")
    @GetMapping(value = "/list")
    @PermissionData(pageComponent = "/list")
    public Result<?> list(OhSampleGroupSite site,
                          @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                          HttpServletRequest req) {
        LambdaQueryWrapper<OhSampleGroupSite> query = new LambdaQueryWrapper<>();
        query.eq(OhSampleGroupSite::getDelFlag, CommonConstant.DEL_FLAG_0);
        query.orderByAsc(OhSampleGroupSite::getCreateTime);
        if (oConvertUtils.isNotEmpty(site.getName())) {
            query.like(OhSampleGroupSite::getName, site.getName());
        }
        List<OhSampleGroupSite> siteList = siteService.list(query);
        if (oConvertUtils.isNotEmpty(site.getLongitude()) && oConvertUtils.isNotEmpty(site.getLatitude())) {
            double longitude = Double.parseDouble(site.getLongitude());
            double latitude = Double.parseDouble(site.getLatitude());

            siteList.forEach(item -> {
                double dis = calculateDistance(latitude, longitude, Double.parseDouble(item.getLatitude()),
                        Double.parseDouble(item.getLongitude()));
                item.setDistance(dis);
            });
            // 按距离排序
            Collections.sort(siteList, new Comparator<OhSampleGroupSite>() {
                @Override
                public int compare(OhSampleGroupSite arg0, OhSampleGroupSite arg1) {
                    return arg0.getDistance().compareTo(arg1.getDistance());
                }
            });
        }
        Page<OhSampleGroupSite> page = new Page<OhSampleGroupSite>(pageNo, pageSize);
        page.setRecords(siteList);
        return Result.OK(page);
    }

    /**
     * 添加
     *
     * @param business 站点
     * @return 添加结果
     */
    @PostMapping(value = "/add")
    @AutoLog(value = "站点添加")
    @ApiOperation(value = "站点添加", notes = "站点添加")
    public Result<?> add(@RequestBody OhSampleGroupSite business) {
        siteService.save(business);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param business 站点
     * @return 编辑结果
     */
    @AutoLog(value = "站点编辑", operateType = CommonConstant.OPERATE_TYPE_3)
    @ApiOperation(value = "站点编辑", notes = "站点编辑")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<?> edit(@RequestBody OhSampleGroupSite business) {
        siteService.updateById(business);
        return Result.OK("更新成功！");
    }

    /**
     * 通过id删除
     *
     * @param id 站点id
     * @return 删除结果
     */
    @AutoLog(value = "站点删除")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除通过ID删除站点", notes = "删除通过ID删除站点")
    public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
        siteService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids 站点ids
     * @return 删除结果
     */
    @DeleteMapping(value = "/deleteBatch")
    @ApiOperation(value = "批量删除站点", notes = "批量删除站点")
    public Result<?> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        siteService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功！");
    }

}
