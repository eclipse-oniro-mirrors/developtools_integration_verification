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

import { defHttp } from '/@/utils/http/axios';
import { Modal } from 'ant-design-vue';

enum Api {
  LIST = '/sample/video/list',
  SAVE = '/sample/video/add',
  EDIT = '/sample/video/edit',
  DELETE = '/sample/video/delete',
  DELETE_BATCH = '/sample/video/deleteBatch',
}

/**
 * 列表接口
 */
export const list = (params): Promise<string> => defHttp.get({ url: Api.LIST, params });

/**
 * 删除
 */
export const deleteVideo = (params, handleSuccess): Promise<void> => {
  return defHttp.delete({ url: Api.DELETE, params }).then(() => {
    handleSuccess();
  });
};

/**
 * 批量删除
 */
export const batchDeleteVideo = (params, handleSuccess): void => {
  Modal.confirm({
    title: '确认删除',
    content: '是否删除选中数据',
    okText: '确认',
    cancelText: '取消',
    onOk: () => {
      return defHttp.delete({ url: Api.DELETE_BATCH, data: params }, { joinParamsToUrl: true }).then(() => {
        handleSuccess();
      });
    },
  });
};

/**
 * 保存或者更新
 */
export const saveOrUpdate = (params, isUpdate): Promise<any> => {
  const url = isUpdate ? Api.EDIT : Api.SAVE;
  return defHttp.post({ url: url, params });
};
