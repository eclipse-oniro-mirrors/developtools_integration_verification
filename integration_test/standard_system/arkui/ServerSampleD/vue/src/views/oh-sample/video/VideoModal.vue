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
  <BasicModal v-bind="$attrs" @register="registerModal" :title="getTitle" @ok="handleOk" @visible-change="visibleChange"
    @cancel="handleCancel" :width="700" :can-fullscreen="false" :show-cancel-btn="false" :show-ok-btn="false">
    <div class="content">
      <span class="title">{{ video.name }}</span>
      <span class="remark">{{ video.remark }}</span>
      <videoPlay ref="playRef" v-bind="options" @play="onPlay" @pause="onPause" @timeupdate="onTimeupdate"
        @canplay="onCanplay" />
      <div class="footer">
        <a-button class="btn" @click="handleNoPass">不通过</a-button>
        <a-button class="btn" type="primary" @click="handlePass">通过</a-button>
      </div>
    </div>
  </BasicModal>
</template>
<script lang="ts" setup>
import 'vue3-video-play/dist/style.css';
import { videoPlay } from 'vue3-video-play';
import { reactive, computed, ref } from 'vue';
import { BasicModal, useModalInner } from '/@/components/Modal';
import { saveOrUpdate } from './video.api';
import { getFileAccessHttpUrl } from '/@/utils/common/compUtils';

// 声明Emits
const emit = defineEmits(['success', 'register']);
let video = reactive({ name: '', status: 0 });
const playRef = ref(null);
// 表单赋值
const [registerModal, { setModalProps, closeModal }] = useModalInner(async (data) => {
  setModalProps({ confirmLoading: false });
  video = data.record;
  options.src = getFileAccessHttpUrl(data.record?.url);
});
// 设置标题
const getTitle = computed(() => ('审核'));
const options = reactive({
  width: '100%', // 播放器
  color: '#409eff', // 主题色
  muted: false, // 静音
  webFullScreen: false,
  speedRate: ['0.75', '1.0', '1.25', '1.5', '2.0'], // 播放倍速
  autoPlay: false, // 自动播放
  loop: false, // 循环播放
  mirror: false, // 镜像画面
  ligthOff: false,  // 关灯模式
  volume: 0.3, // 默认音量大小
  control: true, // 是否显示控制器
  title: '', // 视频名称
  src: '', // 视频源
  poster: '', // 封面
  fit: 'contain'
});

const onPlay = (ev) => {
  console.log(ev, '播放');
};

const onPause = (ev) => {
  console.log(ev, '暂停');
};

const onTimeupdate = (ev) => {
  console.log(ev, '时间更新');
};

const onCanplay = (ev) => {
  console.log(ev, '可以播放');
};

// 表单提交事件
async function handleOk() {
  try {
    // 关闭弹窗
    closeModal();
    // 刷新列表
    emit('success');
  } finally {
    setModalProps({ confirmLoading: false });
  }
}

async function handleCancel() {
  try {
    // 关闭弹窗
    closeModal();
  } finally {
    setModalProps({ confirmLoading: false });
  }
}

async function handleNoPass() {
  // 提交表单
  video.status = 2;
  await saveOrUpdate(video, true);
  handleOk();
}

async function handlePass() {
  // 提交表单
  video.status = 1;
  await saveOrUpdate(video, true);
  handleOk();
}

function visibleChange() {
  const play = playRef.value;
  if (play) {
    play.pause();
  }
}
</script>

<style lang="less" scoped>
.content {
  display: flex;
  width: 100%;
  height: 100%;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.title {
  font-size: 16px;
  font-weight: 500;
  margin-bottom: 10px;
}

.remark {
  font-size: 12px;
  font-weight: 500;
  color: #999;
  margin-bottom: 10px;
}

.footer {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 20px;

  .btn {
    margin-left: 10px;
    margin-right: 10px;
  }
}
</style>
