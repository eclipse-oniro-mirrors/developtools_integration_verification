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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0450
 * 用例描述: 压力测试文本连续长按50次
 * 测试条件: 1.安装测试应用 2.设置震动权限为true，即draggable为true
 * 测试步骤: 文本全选长按，连续长按50次
 * 预期结果: 触发震动50次
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DragVibration0450 {
  @Local testLog: string[] = [];
  @Local longPressCount: number = 0;
  @Local vibrationCount: number = 0;
  @Local testText: string = '这是一段可以选中并长按拖拽的测试文本，请长按选中后进行拖拽操作。';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'DragVibration0450', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0450')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('压力测试 - 文本连续长按50次')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 30 }) {
        Column() {
          Text('长按次数')
            .fontSize(11)
          Text(`${this.longPressCount}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('震动次数')
            .fontSize(11)
          Text(`${this.vibrationCount}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Green)
        }
        Column() {
          Text('目标')
            .fontSize(11)
          Text('50次')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)
        }
      }

      Button('重置计数')
        .onClick(() => {
          this.longPressCount = 0;
          this.vibrationCount = 0;
          this.testLog = [];
          this.addLog('计数已重置');
        })
        .fontSize(12)
        .id('DragVibration0450_ResetBtn')

      Divider().height(1).color('#EEEEEE')

      Column() {
        Text('可拖拽文本区域（长按选中后拖拽）：')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 10 })

        Text(this.testText)
          .fontSize(16)
          .width('100%')
          .padding(15)
          .backgroundColor('#E3F2FD')
          .borderRadius(8)
          .copyOption(CopyOptions.LocalDevice)
          .draggable(true)
          .onDragStart(() => {
            this.longPressCount++;
            this.vibrationCount++;
            this.addLog(`第 ${this.longPressCount} 次长按拖拽，震动触发`);
          })
          .id('DragVibration0450_Text')
      }
      .width('100%')
      .padding(10)

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 长按文本区域选中文字\n2. 拖拽选中的文字\n3. 重复操作50次\n4. 观察震动是否触发50次')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 触发震动50次')
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
      .height('8.2%')
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

