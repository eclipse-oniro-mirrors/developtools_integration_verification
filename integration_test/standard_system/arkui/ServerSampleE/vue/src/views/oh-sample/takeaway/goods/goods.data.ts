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

import type { BasicColumn, FormSchema } from '/@/components/Table';
import { h } from 'vue';
import { Avatar } from 'ant-design-vue';
import { getFileAccessHttpUrl } from '/@/utils/common/compUtils';
import { render } from '/@/utils/common/renderUtils';
import type { Component } from 'vue';

export const columns: BasicColumn[] = [
  {
    title: '名称',
    dataIndex: 'name',
  },
  {
    title: '封面',
    dataIndex: 'cover',
    width: 100,
    customRender: ({ text }): Component => {
      return h(Avatar, {
        src: getFileAccessHttpUrl(text),
        shape: 'square',
        size: 'default',
      });
    },
  },
  {
    title: '价格',
    dataIndex: 'price',
  },
  {
    title: '总量',
    dataIndex: 'totalNumber',
  },
  {
    title: '销量',
    dataIndex: 'salesNumber',
  },
  {
    title: '规格',
    dataIndex: 'standards',
  },
  {
    title: '重量',
    dataIndex: 'weight',
  },
  {
    title: '品牌',
    dataIndex: 'brand',
  },
  {
    title: '品种',
    dataIndex: 'breed',
  },
  {
    title: '产地',
    dataIndex: 'producer',
  },
  {
    title: '国产/进口',
    dataIndex: 'made',
    customRender: ({ text }): Component => {
      return render.renderDict(text, 'made');
    },
  },
  {
    title: '保质期',
    dataIndex: 'qualityDate',
  },
  {
    title: '包装方式',
    dataIndex: 'packing',
  },
  {
    title: '类别',
    dataIndex: 'category',
  },
  {
    title: '口味',
    dataIndex: 'taste',
  },
  {
    title: '储存方式',
    dataIndex: 'keepType',
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'name',
    label: '商品名称',
    component: 'JInput',
    colProps: { span: 8 },
  },
  {
    field: 'category',
    label: '类别',
    component: 'JInput',
    colProps: { span: 8 },
  },
];
export const formSchema: FormSchema[] = [
  {
    field: 'id',
    label: 'id',
    component: 'Input',
    show: false,
  },
  {
    field: 'createBy',
    label: 'createBy',
    component: 'Input',
    show: false,
  },
  {
    field: 'createTime',
    label: 'createTime',
    component: 'Input',
    show: false,
  },
  {
    field: 'name',
    label: '商品名称',
    component: 'Input',
    required: true,
    componentProps: {
      placeholder: '请输入商品名称',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'category',
    label: '类别',
    component: 'Input',
    componentProps: {
      placeholder: '请输入类别',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'price',
    label: '价格',
    component: 'Input',
    componentProps: {
      placeholder: '请输入价格',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'salePrice',
    label: '折后价格',
    component: 'Input',
    componentProps: {
      placeholder: '请输入折后价格',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'totalNumber',
    label: '总量',
    component: 'Input',
    componentProps: {
      placeholder: '请输入总量',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'salesNumber',
    label: '销量',
    component: 'Input',
    componentProps: {
      placeholder: '请输入销量',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'standards',
    label: '规格',
    component: 'Input',
    componentProps: {
      placeholder: '请输入规格',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'weight',
    label: '重量',
    component: 'Input',
    componentProps: {
      placeholder: '请输入重量',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'brand',
    label: '品牌',
    component: 'Input',
    componentProps: {
      placeholder: '请输入品牌',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'breed',
    label: '品种',
    component: 'Input',
    componentProps: {
      placeholder: '请输入品种',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'producer',
    label: '产地',
    component: 'Input',
    componentProps: {
      placeholder: '请输入产地',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'made',
    label: '进口/国产',
    component: 'JDictSelectTag',
    componentProps: {
      dictCode: 'made',
      placeholder: '请选择',
      stringToNumber: true,
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'packing',
    label: '包装方式',
    component: 'Input',
    componentProps: {
      placeholder: '请输入包装方式',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'taste',
    label: '口味',
    component: 'Input',
    componentProps: {
      placeholder: '请输入口味',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'keepType',
    label: '存储方式',
    component: 'Input',
    componentProps: {
      placeholder: '请输入存储方式',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'qualityDate',
    label: '保质期',
    component: 'DatePicker',
    defaultValue: '',
    componentProps: {
      valueFormat: 'YYYY-MM-DD',
      placeholder: '请选择保质期',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'cover',
    label: '封面',
    component: 'JImageUpload',
    componentProps: {
      fileMax: 1,
    },
  },
  {
    field: 'description',
    label: '描述',
    component: 'InputTextArea',
    labelLength: 8,
    componentProps: {
      placeholder: '请输入描述',
    },
  },
];
