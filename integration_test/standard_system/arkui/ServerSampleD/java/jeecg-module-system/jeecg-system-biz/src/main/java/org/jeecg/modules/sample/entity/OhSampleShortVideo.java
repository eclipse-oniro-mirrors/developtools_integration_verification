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
 * 视频实体类
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "视频对象", description = "视频对象")
public class OhSampleShortVideo extends JeecgEntity {

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 视频名称
     */
    @Excel(name = "视频名称", width = 100)
    @ApiModelProperty(value = "视频名称", required = true)
    private String name;

    /**
     * 视频链接
     */
    @Excel(name = "视频链接")
    @ApiModelProperty(value = "视频链接", required = true)
    private String url;

    /**
     * 视频封面
     */
    @Excel(name = "视频封面")
    @ApiModelProperty(value = "视频封面", required = true)
    private String cover;

    /**
     * 视频描述
     */
    @Excel(name = "视频描述")
    @ApiModelProperty(value = "视频描述", required = true)
    private String remark;

    /**
     * 状态(0：未审核  1：审核通过 2：审核不通过 ）
     */
    @Excel(name = "状态", width = 15)
    @ApiModelProperty(value = "状态(0：未审核  1：审核通过 2：审核不通过 ）")
    private Integer status;

    /**
     * 删除状态（0，正常，1已删除）
     */
    @Excel(name = "删除状态", width = 15, dicCode = "del_flag")
    @TableLogic
    private Integer delFlag;
}
