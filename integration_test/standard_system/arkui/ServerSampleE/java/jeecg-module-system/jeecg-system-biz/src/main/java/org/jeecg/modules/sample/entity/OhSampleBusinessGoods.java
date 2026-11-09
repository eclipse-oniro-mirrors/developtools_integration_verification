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
 * 商家商品
 *
 * @since:2023-06-10
 * @Version:V2.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "商家商品", description = "商家商品")
public class OhSampleBusinessGoods extends JeecgEntity {

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
     * 商品名称
     */
    @Excel(name = "商品名称", width = 100)
    @ApiModelProperty(value = "商品名称", required = true)
    private String name;

    /**
     * 商品封面
     */
    @Excel(name = "商品封面", width = 100)
    @ApiModelProperty(value = "商品封面")
    private String cover;

    /**
     * 价格
     */
    @Excel(name = "价格")
    @ApiModelProperty(value = "价格")
    private String price;

    /**
     * 折后价格
     */
    @Excel(name = "折后价格")
    @ApiModelProperty(value = "折后价格")
    private String salePrice;

    /**
     * 价格说明
     */
    @Excel(name = "价格说明", width = 100)
    @ApiModelProperty(value = "价格说明")
    private String priceExplain;

    /**
     * 销量
     */
    @Excel(name = "销量", width = 10)
    @ApiModelProperty(value = "销量")
    private String salesNumber;

    /**
     * 剩余数量
     */
    @Excel(name = "总量", width = 10)
    @ApiModelProperty(value = "总量")
    private String totalNumber;

    /**
     * 描述
     */
    @Excel(name = "描述")
    @ApiModelProperty(value = "描述")
    private String description;

    /**
     * 规格
     */
    @Excel(name = "规格")
    @ApiModelProperty(value = "规格")
    private String standards;

    /**
     * 重量
     */
    @Excel(name = "重量")
    @ApiModelProperty(value = "重量")
    private String weight;

    /**
     * 品牌
     */
    @Excel(name = "品牌")
    @ApiModelProperty(value = "品牌")
    private String brand;

    /**
     * 品种
     */
    @Excel(name = "品种")
    @ApiModelProperty(value = "品种")
    private String breed;

    /**
     * 进口/国产
     */
    @Excel(name = "进口/国产", width = 15, dicCode = "made")
    @ApiModelProperty(value = "国产0，进口1")
    private Integer made;

    /**
     * 产地
     */
    @Excel(name = "产地")
    @ApiModelProperty(value = "产地")
    private String producer;

    /**
     * 保质期
     */
    @Excel(name = "保质期")
    @ApiModelProperty(value = "保质期")
    private String qualityDate;

    /**
     * 包装方式
     */
    @Excel(name = "包装方式")
    @ApiModelProperty(value = "包装方式")
    private String packing;

    /**
     * 类别
     */
    @Excel(name = "类别")
    @ApiModelProperty(value = "类别")
    private String category;

    /**
     * 口味
     */
    @Excel(name = "口味")
    @ApiModelProperty(value = "口味")
    private String taste;

    /**
     * 储存方式
     */
    @Excel(name = "储存方式")
    @ApiModelProperty(value = "储存方式")
    private String keepType;

    /**
     * 删除状态（0，正常，1已删除）
     */
    @Excel(name = "删除状态", width = 15, dicCode = "del_flag")
    @TableLogic
    private Integer delFlag;
}
