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
 
<template>
  <div>
    <BasicTable @register="registerTable" :rowSelection="rowSelection">
      <template #tableTitle>
        <a-dropdown v-if="selectedRowKeys.length > 0">
          <template #overlay>
            <a-menu>
              <a-menu-item key="1" @click="batchHandleDelete">
                <Icon icon="ant-design:delete-outlined"></Icon>
                删除
              </a-menu-item>
            </a-menu>
          </template>
          <a-button>批量操作
            <Icon icon="ant-design:down-outlined"></Icon>
          </a-button>
        </a-dropdown>
      </template>
      <template #action="{ record }">
        <TableAction :actions="getActions(record)" />
      </template>
    </BasicTable>
    <VideoModal @register="registerModal" @success="reload" />
  </div>
</template>
<script lang="ts" name="system-position" setup>
import { BasicTable, TableAction } from '/@/components/Table';
import { list, batchDeleteVideo } from './video.api';
import { columns, searchFormSchema } from './video.data';
import { useListPage } from '/@/hooks/system/useListPage';
import { useModal } from '/@/components/Modal';
import VideoModal from './VideoModal.vue';
const [registerModal, { openModal }] = useModal();

// 列表页面公共参数、方法
const { tableContext } = useListPage({
  designScope: 'position-template',
  tableProps: {
    title: '视频列表',
    api: list,
    columns: columns,
    formConfig: {
      schemas: searchFormSchema,
    }
  }
});

const [registerTable, { reload }, { rowSelection, selectedRowKeys }] = tableContext;

/**
 * 操作列定义
 */
function getActions(record) {
  return [
    {
      label: '审核',
      onClick: handleEdit.bind(null, record)
    }
  ];
}

/**
 * 编辑事件
 */
function handleEdit(record) {
  openModal(true, {
    record
  });
}

/**
 * 批量删除事件
 */
async function batchHandleDelete() {
  await batchDeleteVideo({ ids: selectedRowKeys.value }, () => {
    reload();
    selectedRowKeys.value = [];
  });
}
</script>
