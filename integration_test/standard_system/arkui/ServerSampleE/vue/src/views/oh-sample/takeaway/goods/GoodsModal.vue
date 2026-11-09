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
  </BasicModal>
</template>
<script lang="ts" setup>
import { ref, computed, unref, defineProps } from 'vue';
import { BasicModal, useModalInner } from '/@/components/Modal';
import { BasicForm, useForm } from '/@/components/Form/index';
import { formSchema } from './goods.data';
import { saveOrUpdateGoods } from './goods.api';
// 声明Emits
const emit = defineEmits(['register', 'success']);
const isUpdate = ref(true);
const businessId = ref(null);

//自定义接受参数
const props = defineProps({
  //是否禁用页面
  isDisabled: {
    type: Boolean,
    default: false,
  },
});

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
  isUpdate.value = data?.isUpdate;
  businessId.value = data?.record?.businessId;
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
});
//设置标题
const title = computed(() => (props.isDisabled ? '详情' : !unref(isUpdate) ? '新增' : '编辑'));
//表单提交事件
async function handleSubmit() {
  try {
    let values = await validate();
    values.businessId = businessId.value;
    setModalProps({ confirmLoading: true });
    //提交表单
    await saveOrUpdateGoods(values, isUpdate.value);
    //关闭弹窗
    closeModal();
    //刷新列表
    emit('success', values);
  } finally {
    setModalProps({ confirmLoading: false });
  }
}
</script>
