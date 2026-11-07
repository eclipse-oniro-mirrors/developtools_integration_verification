/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INPUT_0270
 * 用例描述: 在TextArea、TextInput、Search拖拽启动中，长按拖拽，跟手图显示正确
 * 测试条件: 1、创建ets页面
 * 测试步骤: 1、进入demo中 2、选中组件内的文本，长按，在还未完全显示出预览图时进行拖拽
 * 预期结果: 2-1、可以拖拽，跟手图显示正确
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DragInput0270 {
  @Local testLog: string[] = [];
  @Local textAreaValue: string = '这是TextArea中的文本内容，请选中后长按拖拽测试跟手图效果。';
  @Local textInputValue: string = '这是TextInput中的文本';
  @Local searchValue: string = '搜索文本内容';
  @Local dragStatus: string = '等待拖拽';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'DragInput0270', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_INPUT_0270')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('输入组件拖拽 - 跟手图显示')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(this.dragStatus === '拖拽中...' ? Color.Orange : Color.Green)

      Divider().height(1).color('#EEEEEE')

      // TextArea
      Column() {
        Text('TextArea:')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        TextArea({ text: this.textAreaValue })
          .fontSize(14)
          .width('100%')
          .height(80)
          .backgroundColor('#E8F5E9')
          .borderRadius(8)
          .copyOption(CopyOptions.LocalDevice)
          .draggable(true)
          .onChange((value: string) => {
            this.textAreaValue = value;
          })
          .onDragStart(() => {
            this.dragStatus = '拖拽中...';
            this.addLog('TextArea: 拖拽开始，跟手图应显示');
          })
          .onDragEnd(() => {
            this.dragStatus = '拖拽结束';
            this.addLog('TextArea: 拖拽结束');
          })
          .id('DragInput0270_TextArea')
      }
      .width('100%')

      // TextInput
      Column() {
        Text('TextInput:')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        TextInput({ text: this.textInputValue })
          .fontSize(14)
          .width('100%')
          .height(45)
          .backgroundColor('#E3F2FD')
          .borderRadius(8)
          .copyOption(CopyOptions.LocalDevice)
          .draggable(true)
          .onChange((value: string) => {
            this.textInputValue = value;
          })
          .onDragStart(() => {
            this.dragStatus = '拖拽中...';
            this.addLog('TextInput: 拖拽开始，跟手图应显示');
          })
          .onDragEnd(() => {
            this.dragStatus = '拖拽结束';
            this.addLog('TextInput: 拖拽结束');
          })
          .id('DragInput0270_TextInput')
      }
      .width('100%')

      // Search
      Column() {
        Text('Search:')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        Search({ value: this.searchValue })
          .width('100%')
          .height(45)
          .backgroundColor('#FFF3E0')
          .borderRadius(8)
          .copyOption(CopyOptions.LocalDevice)
          .draggable(true)
          .onChange((value: string) => {
            this.searchValue = value;
          })
          .onDragStart(() => {
            this.dragStatus = '拖拽中...';
            this.addLog('Search: 拖拽开始，跟手图应显示');
          })
          .onDragEnd(() => {
            this.dragStatus = '拖拽结束';
            this.addLog('Search: 拖拽结束');
          })
          .id('DragInput0270_Search')
      }
      .width('100%')

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 选中组件内的文本\n2. 长按，在未完全显示预览图时拖拽\n3. 观察跟手图是否正确显示')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 可以拖拽，跟手图显示正确')
        .fontSize(10)
        .fontColor('#4CAF50')

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('6.56%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}

