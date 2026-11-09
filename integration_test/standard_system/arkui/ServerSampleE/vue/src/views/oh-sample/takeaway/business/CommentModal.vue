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
  <BasicModal v-bind="$attrs" @register="registerModal" title="查看详情" :minHeight="200" :showCancelBtn="false"
    :showOkBtn="false">
    <a-card class="daily-article">
      <a-card-meta :description="'用户名：' + comment.userName + '  评价时间： ' + comment.createTime"> </a-card-meta>
      <a-rate v-model:value="comment.star" style="margin-top: 8px;" />
      <a-divider />
      <span v-html="comment.content" class="article-content"></span>
    </a-card>
  </BasicModal>
</template>
<script lang="ts" setup>
import { BasicModal, useModalInner } from '/@/components/Modal';

import { ref } from 'vue';
const comment = ref({
  userName: '',
  createTime: '',
  star: 0,
  content: ''
});
//表单赋值
const [registerModal] = useModalInner(async (data) => {
  comment.value = data.record;
});

</script>

<style scoped lang="less"></style>
