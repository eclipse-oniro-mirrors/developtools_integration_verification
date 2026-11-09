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
  <BasicModal v-bind="$attrs" @register="registerModal" :title="title" @ok="handleSubmit" width="40%">
    <BasicForm :labelWidth="100" :actionColOptions="{ span: 24 }" :labelCol="{ span: 8 }" @register="registerForm"
      :disabled="isDisabled" />
    <a-tabs defaultActiveKey="1" v-if="isUpdate">
      <a-tab-pane tab="商品" key="1">
        <div style="width:100%;display: flex;justify-content: right;margin-bottom: 10px;" v-if="!isDisabled">
          <a-button type="primary" @click="handleAdd">新增</a-button>
        </div>

        <a-table ref="table" size="small" rowKey="id" class="j-table-force-nowrap" :columns="columns1" :dataSource="data1"
          :pagination="ipagination1" :loading="loading1" @change="handleTableChange1">
          <template #imgSlot="{ text, record }">
            <span v-if="!text" style="font-size: 12px; font-style: italic">无图片</span>
            <img v-else :src="getImgView(text)" :preview="getImgView(text)" alt="{{record.name}}" class="anty-img-wrap" />
          </template>


          <template #action="{ text, record }">
            <a @click="handleDetail1(record)">详情</a>
            <template v-if="!isDisabled">
              <a-divider type="vertical" />
              <a @click="handleEdit(record)">编辑</a>
              <a-divider type="vertical" />
              <a-popconfirm title="确定删除吗?" @confirm="() => handleDelete(record)">
                <a>删除</a>
              </a-popconfirm>
            </template>
          </template>
        </a-table>
      </a-tab-pane>

      <a-tab-pane tab="评价" key="2" forceRender>
        <a-table ref="table" size="small" rowKey="id" class="j-table-force-nowrap" :columns="columns2" :dataSource="data2"
          :pagination="ipagination2" :loading="loading2" @change="handleTableChange2">

          <template #action="{ text, record }">
            <a @click="handleDetail2(record)">详情</a>
          </template>
        </a-table>
      </a-tab-pane>
    </a-tabs>
    <GoodsModal @register="registerGoodsModal" @success="list1(1)" :isDisabled="isDisabledGoods" />
    <CommentModal @register="registerCommentModal" />
  </BasicModal>
</template>
<script lang="ts" setup>
import { ref, computed, unref } from 'vue';
import { BasicModal, useModalInner } from '/@/components/Modal';
import { BasicForm, useForm } from '/@/components/Form/index';
import { formSchema, columnsGoods, columnsComment } from './business.data';
import { saveOrUpdate, listComment } from './business.api';
import { getFileAccessHttpUrl } from '/@/utils/common/compUtils';
import { useModal } from '/@/components/Modal';
import GoodsModal from '../goods/GoodsModal.vue';
import CommentModal from './CommentModal.vue';
import { listGoods, deleteGoods } from '../goods/goods.api';
// 声明Emits
const emit = defineEmits(['register', 'success']);
const isUpdate = ref(true);
const isDisabledGoods = ref(true);
const [registerGoodsModal, { openModal: openGoodsModal }] = useModal();
const [registerCommentModal, { openModal: openCommentModal }] = useModal();

//自定义接受参数
const props = defineProps({
  //是否禁用页面
  isDisabled: {
    type: Boolean,
    default: false,
  },
});
const businessModel = ref({ id: null, businessId: null });

const ipagination1 = ref<any>({
  current: 1,
  pageSize: 10,
  pageSizeOptions: ['10', '20', '30'],
  showTotal: (total, range) => {
    return range[0] + '-' + range[1] + ' 共' + total + '条';
  },
  showQuickJumper: true,
  showSizeChanger: true,
  total: 0,
});
const ipagination2 = ref<any>({
  current: 1,
  pageSize: 10,
  pageSizeOptions: ['10', '20', '30'],
  showTotal: (total, range) => {
    return range[0] + '-' + range[1] + ' 共' + total + '条';
  },
  showQuickJumper: true,
  showSizeChanger: true,
  total: 0,
});
const columns1 = ref(columnsGoods);
const columns2 = ref(columnsComment);
const data1 = ref<any>([]);
const data2 = ref<any>([]);
const loading1 = ref(false);
const loading2 = ref(false);

//表单配置
const [registerForm, { resetFields, setFieldsValue, validate }] = useForm({
  //labelWidth: 150,
  schemas: formSchema,
  showActionButtonGroup: false,
});
//表单赋值
const [registerModal, { setModalProps, closeModal }] = useModalInner(async (data) => {
  //重置表单
  await resetFields();
  setModalProps({ confirmLoading: false, showOkBtn: !props.isDisabled });
  isUpdate.value = !!data?.isUpdate;
  businessModel.value = data.record;
  if (data.createBy) {
    await setFieldsValue({ createBy: data.createBy });
  }
  if (data.createTime) {
    await setFieldsValue({ createTime: data.createTime });
  }
  //表单赋值
  await setFieldsValue({
    ...data.record,
  });
  if (unref(isUpdate)) {
    list1(1);
    list2(1);
  }
});
//设置标题
const title = computed(() => (props.isDisabled ? '详情' : !unref(isUpdate) ? '新增' : '编辑'));
//表单提交事件
async function handleSubmit() {
  try {
    let values = await validate();
    setModalProps({ confirmLoading: true });
    //提交表单
    await saveOrUpdate(values, isUpdate.value);
    //关闭弹窗
    closeModal();
    //刷新列表
    emit('success', values);
  } finally {
    setModalProps({ confirmLoading: false });
  }
}


/**
 * 获取预览图片
 */
function getImgView(text) {
  if (text && text.indexOf(',') > 0) {
    text = text.substring(0, text.indexOf(','));
  }
  return getFileAccessHttpUrl(text);
}

function list1(flag: number) {
  if (flag === 1) {
    ipagination1.value.current = 1;
  }
  loading1.value = true;
  const params = {
    businessId: businessModel.value.id,
    pageNo: ipagination1.value.current,
    pageSize: ipagination1.value.pageSize
  };
  listGoods(params).then((data) => {
    data1.value = data.records;
    ipagination1.value.total = data.total;
    loading1.value = false;
  });
}

function list2(flag: number) {
  if (flag === 1) {
    ipagination2.value.current = 1;
  }
  loading2.value = true;
  const params = {
    businessId: businessModel.value.id,
    pageNo: ipagination2.value.current,
    pageSize: ipagination2.value.pageSize
  };
  listComment(params).then((data) => {
    data2.value = data.records;
    ipagination2.value.total = data.total;
    loading2.value = false;
  });
}

function handleAdd() {
  isDisabledGoods.value = false;
  openGoodsModal(true, {
    record: { businessId: businessModel.value.id },
    isUpdate: false,
  });
}

function handleEdit(record) {;
  isDisabledGoods.value = false;
  openGoodsModal(true, {
    record,
    isUpdate: true,
  });
}

function handleDetail1(record) {
  isDisabledGoods.value = true;
  openGoodsModal(true, {
    record,
    isUpdate: false,
  });
}

function handleDetail2(record) {
  openCommentModal(true, {
    record,
    isUpdate: false,
  });
}

async function handleDelete(record) {
  await deleteGoods({ id: record.id }, list1);
}

function handleTableChange1(pagination, filters, sorter) {
  ipagination1.value = pagination;
  list1(0);
}

function handleTableChange2(pagination, filters, sorter) {
  ipagination2.value = pagination;
  list2(0);
}

</script>
