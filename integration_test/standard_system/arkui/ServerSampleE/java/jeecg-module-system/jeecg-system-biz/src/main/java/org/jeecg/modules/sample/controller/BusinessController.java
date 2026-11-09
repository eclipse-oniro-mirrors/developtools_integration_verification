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
import org.jeecg.modules.sample.entity.OhSampleBusiness;
import org.jeecg.modules.sample.service.IBusinessService;
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
 * 商家
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Slf4j
@RestController
@RequestMapping("/sample/business")
@Api(tags = "oh-sample仿商家")
public class BusinessController {
    private final double earthRadius = 6371d; // 地球平均半径，单位为千米

    @Autowired
    private IBusinessService mtBusinessService;

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
     * @param mtBusiness 商家
     * @param pageNo 分页参数-页码
     * @param pageSize 分页参数-每页条数
     * @param req HttpServletRequest
     * @return 商家列表
     */
    @ApiOperation(value = "商家列表", notes = "商家列表")
    @GetMapping(value = "/list")
    @PermissionData(pageComponent = "/list")
    public Result<?> list(OhSampleBusiness mtBusiness,
                          @RequestParam(name = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(name = "pageSize", defaultValue = "10") Integer pageSize,
                          HttpServletRequest req) {
        LambdaQueryWrapper<OhSampleBusiness> query = new LambdaQueryWrapper<>();
        query.eq(OhSampleBusiness::getDelFlag, CommonConstant.DEL_FLAG_0);
        query.orderByAsc(OhSampleBusiness::getCreateTime);
        if (oConvertUtils.isNotEmpty(mtBusiness.getName())) {
            query.like(OhSampleBusiness::getName, mtBusiness.getName());
        }
        List<OhSampleBusiness> mtBusinessList = mtBusinessService.list(query);
        if (oConvertUtils.isNotEmpty(mtBusiness.getLongitude()) &&
                oConvertUtils.isNotEmpty(mtBusiness.getLatitude())) {
            double longitude = Double.parseDouble(mtBusiness.getLongitude());
            double latitude = Double.parseDouble(mtBusiness.getLatitude());
            mtBusinessList.forEach(item -> {
                double dis = calculateDistance(latitude, longitude,
                        Double.parseDouble(item.getLatitude()), Double.parseDouble(item.getLongitude()));
                item.setDistance(dis);
            });
            // 按距离排序
            Collections.sort(mtBusinessList, new Comparator<OhSampleBusiness>() {
                @Override
                public int compare(OhSampleBusiness arg0, OhSampleBusiness arg1) {
                    return arg0.getDistance().compareTo(arg1.getDistance());
                }
            });
        }
        Page<OhSampleBusiness> page = new Page<OhSampleBusiness>(pageNo, pageSize);
        page.setRecords(mtBusinessList);
        return Result.OK(page);
    }

    /**
     * 详情
     *
     * @param id 商家id
     * @return 商家详情
     */
    @GetMapping(value = "/detail")
    @AutoLog(value = "商家详情")
    @ApiOperation(value = "商家详情", notes = "商家详情")
    public Result<?> detail(@RequestParam(name = "id") String id) {
        OhSampleBusiness business = mtBusinessService.getById(id);
        return Result.OK(business);
    }

    /**
     * 添加
     *
     * @param business 商家
     * @return 添加结果
     */
    @PostMapping(value = "/add")
    @AutoLog(value = "商家添加")
    @ApiOperation(value = "商家添加", notes = "商家添加")
    public Result<?> add(@RequestBody OhSampleBusiness business) {
        System.out.println("business= " + business.toString());
        mtBusinessService.save(business);
        return Result.OK("添加成功！");
    }

    /**
     * 编辑
     *
     * @param business 商家
     * @return 编辑结果
     */
    @AutoLog(value = "商家编辑", operateType = CommonConstant.OPERATE_TYPE_3)
    @ApiOperation(value = "商家编辑", notes = "商家编辑")
    @RequestMapping(value = "/edit", method = {RequestMethod.PUT, RequestMethod.POST})
    public Result<?> edit(@RequestBody OhSampleBusiness business) {
        mtBusinessService.updateById(business);
        return Result.OK("更新成功！");
    }

    /**
     * 通过id删除
     *
     * @param id 商家id
     * @return 删除结果
     */
    @AutoLog(value = "商家删除")
    @DeleteMapping(value = "/delete")
    @ApiOperation(value = "删除通过ID删除商家", notes = "删除通过ID删除商家")
    public Result<?> delete(@RequestParam(name = "id", required = true) String id) {
        mtBusinessService.removeById(id);
        return Result.OK("删除成功!");
    }

    /**
     * 批量删除
     *
     * @param ids 商家ids
     * @return 删除结果
     */
    @DeleteMapping(value = "/deleteBatch")
    @ApiOperation(value = "批量删除商家", notes = "批量删除商家")
    public Result<?> deleteBatch(@RequestParam(name = "ids", required = true) String ids) {
        mtBusinessService.removeByIds(Arrays.asList(ids.split(",")));
        return Result.OK("批量删除成功！");
    }

}
