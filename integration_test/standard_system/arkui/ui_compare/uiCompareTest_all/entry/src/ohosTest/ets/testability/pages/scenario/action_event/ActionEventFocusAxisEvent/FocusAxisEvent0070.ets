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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0070
 * 用例描述: 使用手柄触发FocusAxisEvent-source
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆
 * 预期结果: 手柄打印1
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0070 {
  @Local testLog: string[] = [];
  @Local sourceValue: string = '-';
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local isCorrect: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0070', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0070')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('使用手柄触发FocusAxisEvent-source')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // source信息显示区域
      Column({ space: 4 }) {
        Text('Source信息:').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`source值: ${this.sourceValue}`)
          .fontSize(18)
          .fontColor(this.isCorrect ? '#4CAF50' : '#2196F3')
          .fontWeight(FontWeight.Bold)
        Text(`事件触发次数: ${this.eventCount}`)
          .fontSize(12)
          .fontColor(Color.Gray)
        if (this.isCorrect) {
          Text('✓ 验证通过：手柄source值为1')
            .fontSize(12)
            .fontColor('#4CAF50')
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Divider().height(1).color('#EEEEEE')

      // 测试按钮
      Button('测试按钮 - 使用手柄遥杆触发')
        .width('80%')
        .height(60)
        .fontSize(14)
        .backgroundColor(this.isCorrect ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0070_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          this.sourceValue = `${event.source}`;
          if (event.source === 1) {
            this.isCorrect = true;
          }
          this.addLog(`source: ${event.source}`);
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 连接手柄设备\n2. 确保按钮已获焦（默认获焦）\n3. 移动手柄的遥杆\n4. 观察source值')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 手柄打印source值为1')
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

