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
import { render } from '/@/utils/common/renderUtils';
import { getFileAccessHttpUrl } from '/@/utils/common/compUtils';
import { Component } from 'vue';

export const columns: BasicColumn[] = [
  {
    title: '视频名称',
    dataIndex: 'name',
  },
  {
    title: '视频描述',
    dataIndex: 'remark',
  },
  {
    title: '视频链接',
    dataIndex: 'url',
    customRender: ({ text }): Promise<string> => {
      return getFileAccessHttpUrl(text);
    },
  },
  {
    title: '审核状态',
    dataIndex: 'status',
    width: 120,
    customRender: ({ text }): Component => {
      return render.renderDict(text, 'check_status');
    },
  },
  {
    title: '上传作者',
    dataIndex: 'createBy',
    width: 120
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'name',
    label: '视频名称',
    component: 'JInput',
    colProps: { span: 8 },
  },
  {
    field: 'status',
    label: '审核状态',
    component: 'Select',
    componentProps: {
      options: [
        { label: '未审核', value: '0' },
        { label: '审核通过', value: '1' },
        { label: '审核不通过', value: '2' },
      ],
    },
    colProps: { span: 8 },
  },
];
