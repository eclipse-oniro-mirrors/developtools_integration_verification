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
        <a-button type="primary" preIcon="ant-design:plus-outlined" @click="handleAdd"> 新增</a-button>
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
    <BusinessModal @register="registerModal" @success="reload" :isDisabled="isDisabled" />
  </div>
</template>
<script lang="ts" name="system-position" setup>
import { ref } from 'vue';
import { BasicTable, TableAction } from '/@/components/Table';
import { list, deleteBusiness, batchDeleteBusiness } from './business.api';
import { columns, searchFormSchema } from './business.data';
import { useListPage } from '/@/hooks/system/useListPage';
import { useModal } from '/@/components/Modal';
import BusinessModal from './BusinessModal.vue';
const [registerModal, { openModal }] = useModal();

// 列表页面公共参数、方法
const { tableContext } = useListPage({
  designScope: 'position-template',
  tableProps: {
    title: '商家列表',
    api: list,
    columns: columns,
    formConfig: {
      schemas: searchFormSchema,
    }
  }
});

const isDisabled = ref(false);
const [registerTable, { reload }, { rowSelection, selectedRowKeys }] = tableContext;

/**
 * 操作列定义
 */
function getActions(record) {
  return [
    {
      label: '详情',
      onClick: handleDetail.bind(null, record),
    },
    {
      label: '编辑',
      onClick: handleEdit.bind(null, record),
    },
    {
      label: '删除',
      popConfirm: {
        title: '是否确认删除',
        confirm: handleDelete.bind(null, record),
      },
    },
  ];
}

/**
  * 新增事件
  */
function handleAdd() {
  isDisabled.value = false;
  openModal(true, {
    isUpdate: false,
  });
}

/**
* 详情页面
*/
function handleDetail(record) {
  isDisabled.value = true;
  openModal(true, {
    record,
    isUpdate: true,
  });
}

/**
 * 编辑事件
 */
function handleEdit(record) {
  isDisabled.value = false;
  openModal(true, {
    record,
    isUpdate: true,
  });
}

/**
  * 删除事件
  */
async function handleDelete(record) {
  await deleteBusiness({ id: record.id }, reload);
}


/**
 * 批量删除事件
 */
async function batchHandleDelete() {
  await batchDeleteBusiness({ ids: selectedRowKeys.value }, () => {
    reload();
    selectedRowKeys.value = [];
  });
}
</script>
