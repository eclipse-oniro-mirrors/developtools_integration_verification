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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0240
 * 用例描述: 使用手柄触发FocusAxisEvent-timestamp（Modifier）
 * 测试条件: 创建button组件，使用Modifier方式绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆
 * 预期结果: 打印事件触发的时间戳
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0240 {
  @Local testLog: string[] = [];
  @Local currentTimestamp: string = '-';
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;

  private focusAxisModifier: FocusAxisEventModifier0240 = new FocusAxisEventModifier0240((event: FocusAxisEvent) => {
    this.eventTriggered = true;
    this.eventCount++;
    this.currentTimestamp = `${event.timestamp}`;
    this.addLog(`[Modifier] timestamp: ${event.timestamp}`);
  });

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0240', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0240')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('FocusAxisEvent-timestamp（Modifier方式）')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // Timestamp信息显示区域
      Column({ space: 4 }) {
        Text('Timestamp信息 (Modifier):').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`当前时间戳: ${this.currentTimestamp}`)
          .fontSize(14)
          .fontColor('#2196F3')
        Text(`事件触发次数: ${this.eventCount}`)
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      // 测试按钮 - 使用Modifier方式
      Button('测试按钮 - Modifier方式')
        .width('80%')
        .height(60)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0240_Button')
        .focusable(true)
        .defaultFocus(true)
        .attributeModifier(this.focusAxisModifier)

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 连接手柄设备\n2. 确保按钮已获焦\n3. 移动手柄的遥杆\n4. 观察timestamp（Modifier方式）')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 使用Modifier方式获取timestamp正确')
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
      .height('9.84%')
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

class FocusAxisEventModifier0240 implements AttributeModifier<ButtonAttribute> {
  private callback: (event: FocusAxisEvent) => void;

  constructor(callback: (event: FocusAxisEvent) => void) {
    this.callback = callback;
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.onFocusAxisEvent(this.callback);
  }
}

