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
 * 商家评论
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "商家评论", description = "商家评论")
public class OhSampleBusinessComment extends JeecgEntity {

    /**
     * id
     */
    @TableId(type = IdType.ASSIGN_ID)
    private String id;

    /**
     * 商家id
     */
    @Excel(name = "商家id", width = 36)
    @ApiModelProperty(value = "商家id")
    private String businessId;

    /**
     * 用户名
     */
    @Excel(name = "用户名", width = 36)
    @ApiModelProperty(value = "用户名")
    private String userName;

    /**
     * 评分
     */
    @Excel(name = "评分", width = 2)
    @ApiModelProperty(value = "评分")
    private Integer star;

    /**
     * 内容
     */
    @Excel(name = "内容")
    @ApiModelProperty(value = "内容")
    private String content;

    /**
     * 删除状态（0，正常，1已删除）
     */
    @Excel(name = "删除状态", width = 15, dicCode = "del_flag")
    @TableLogic
    private Integer delFlag;
}
