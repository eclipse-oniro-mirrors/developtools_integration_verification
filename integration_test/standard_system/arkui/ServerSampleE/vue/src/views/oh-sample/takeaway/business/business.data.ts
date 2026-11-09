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
    title: '是否营业',
    dataIndex: 'isOpen',
    customRender: ({ text }): Component => {
      return render.renderDict(text, 'yn');
    },
  },
  {
    title: '地址',
    dataIndex: 'address',
  },
  {
    title: '距离',
    dataIndex: 'distance',
    customRender: ({ text }): string => {
      return text != null ? text + 'km' : '';
    },
  },
  {
    title: '营业开始时间',
    dataIndex: 'startTime',
    width: 120,
  },
  {
    title: '营业结束时间',
    dataIndex: 'endTime',
    width: 120,
  },
];

export const columnsGoods: BasicColumn[] = [
  {
    title: '商品名称',
    dataIndex: 'name',
    align: 'center',
  },
  {
    title: '封面',
    dataIndex: 'cover',
    width: 100,
    align: 'center',
    slots: { customRender: 'imgSlot' },
  },
  {
    title: '添加时间',
    align: 'center',
    dataIndex: 'createTime',
  },
  {
    title: '操作',
    align: 'center',
    dataIndex: 'action',
    slots: { customRender: 'action' },
  },
];

export const columnsComment: BasicColumn[] = [
  {
    title: '用户',
    dataIndex: 'userName',
    align: 'center',
  },
  {
    title: '评分',
    dataIndex: 'star',
    align: 'center',
  },
  {
    title: '内容',
    dataIndex: 'content',
    align: 'center',
    width: 200,
    ellipsis: true,
  },
  {
    title: '时间',
    dataIndex: 'createTime',
    align: 'center',
  },
  {
    title: '操作',
    align: 'center',
    dataIndex: 'action',
    slots: { customRender: 'action' },
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'name',
    label: '商家名称',
    component: 'Input',
    colProps: { span: 8 },
  },
  {
    field: 'longitude',
    label: '经度',
    component: 'Input',
    colProps: { span: 4 },
  },
  {
    field: 'latitude',
    label: '纬度',
    component: 'Input',
    colProps: { span: 4 },
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
    label: '商家名称',
    component: 'Input',
    required: true,
    componentProps: {
      placeholder: '请输入商家名称',
    },
  },
  {
    field: 'isOpen',
    label: '是否营业',
    component: 'JDictSelectTag',
    required: true,
    componentProps: {
      dictCode: 'yn',
      placeholder: '请选择',
      stringToNumber: true,
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'address',
    label: '地址',
    component: 'Input',
    componentProps: {
      placeholder: '请输入地址',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'longitude',
    label: '经度',
    component: 'Input',
    componentProps: {
      placeholder: '请输入经度',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'latitude',
    label: '纬度',
    component: 'Input',
    componentProps: {
      placeholder: '请输入纬度',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'startTime',
    label: '营业开始时间',
    component: 'Input',
    componentProps: {
      placeholder: '请输入开始时间',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'endTime',
    label: '营业结束时间',
    component: 'Input',
    componentProps: {
      placeholder: '请输入结束时间',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'startPrice',
    label: '起送费',
    component: 'InputNumber',
    componentProps: {
      placeholder: '请输入起送费',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'deliveryPrice',
    label: '配送费',
    component: 'InputNumber',
    componentProps: {
      placeholder: '请输入配送费',
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
    field: 'phoneNumber',
    label: '商家号码',
    component: 'Input',
    componentProps: {
      placeholder: '请输入商家号码',
    },
    colProps: {
      span: 11,
    },
  },
  {
    field: 'notice',
    label: '公告',
    component: 'InputTextArea',
    labelLength: 8,
    componentProps: {
      placeholder: '请输入公告',
    },
  },
];
