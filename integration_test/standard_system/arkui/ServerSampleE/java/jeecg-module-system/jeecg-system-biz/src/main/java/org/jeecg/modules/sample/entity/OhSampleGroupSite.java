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

package org.jeecg.modules.sample.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.jeecg.common.system.base.entity.JeecgEntity;
import org.jeecgframework.poi.excel.annotation.Excel;

/**
 * 站点
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "站点", description = "站点")
public class OhSampleGroupSite extends JeecgEntity {

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 名称
     */
    @Excel(name = "名称", width = 100)
    @ApiModelProperty(value = "名称", required = true)
    private String name;

    /**
     * 封面
     */
    @Excel(name = "封面", width = 100)
    @ApiModelProperty(value = "封面")
    private String cover;

    /**
     * 是否营业
     */
    @Excel(name = "是否营业", width = 15, dicCode = "yn")
    @ApiModelProperty(value = "是否营业")
    private Integer isOpen;

    /**
     * 地址
     */
    @Excel(name = "地址", width = 255)
    @ApiModelProperty(value = "地址")
    private String address;

    /**
     * 2个经纬度之间距离，单位千米
     */
    private Double distance;

    /**
     * 经度
     */
    @Excel(name = "经度", width = 32)
    @ApiModelProperty(value = "经度")
    private String longitude;

    /**
     * 纬度
     */
    @Excel(name = "纬度", width = 32)
    @ApiModelProperty(value = "纬度")
    private String latitude;

    /**
     * 开始时间
     */
    @Excel(name = "开始时间")
    @ApiModelProperty(value = "开始时间")
    private String startTime;

    /**
     * 结束时间
     */
    @Excel(name = "结束时间")
    @ApiModelProperty(value = "结束时间")
    private String endTime;

    /**
     * 公告
     */
    @Excel(name = "公告")
    @ApiModelProperty(value = "公告")
    private String notice;

    /**
     * 删除状态（0，正常，1已删除）
     */
    @Excel(name = "删除状态", width = 15, dicCode = "del_flag")
    @TableLogic
    private Integer delFlag;
}
