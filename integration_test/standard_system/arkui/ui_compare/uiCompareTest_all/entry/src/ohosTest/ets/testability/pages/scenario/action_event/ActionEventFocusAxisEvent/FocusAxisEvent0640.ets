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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0640
 * 用例描述: 频繁调用FocusAxisEvent事件
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件，调用100次
 * 测试步骤: 1、编写py脚本 2、运行MTBF测试
 * 预期结果: 事件能正常响应
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0640 {
  @Local testLog: string[] = [];
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local targetCount: number = 100;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'FocusAxisEvent0640', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0640')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('频繁调用FocusAxisEvent事件（100次）')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('MTBF测试状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`事件触发次数: ${this.eventCount} / ${this.targetCount}`)
          .fontSize(16)
          .fontColor(this.eventCount >= this.targetCount ? '#4CAF50' : '#2196F3')
          .fontWeight(FontWeight.Bold)
        
        Progress({ value: this.eventCount, total: this.targetCount })
          .width('90%')
          .height(10)
        
        if (this.eventCount >= this.targetCount) {
          Text('✓ 测试通过：100次事件正常响应')
            .fontSize(12)
            .fontColor('#4CAF50')
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Button('重置计数')
        .width('40%')
        .height(35)
        .fontSize(12)
        .backgroundColor('#FF9800')
        .onClick(() => {
          this.eventCount = 0;
          this.eventTriggered = false;
          this.testLog = [];
          this.addLog('计数已重置');
        })

      Button('测试按钮 - 连续触发100次')
        .width('80%')
        .height(60)
        .fontSize(14)
        .backgroundColor(this.eventCount >= this.targetCount ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0640_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          
          if (this.eventCount <= 10 || this.eventCount % 10 === 0) {
            this.addLog(`事件触发 #${this.eventCount}`);
          }
          
          if (this.eventCount === this.targetCount) {
            this.addLog(`✓ 达到目标次数 ${this.targetCount}!`);
          }
        })

      Text('预期: 100次事件正常响应')
        .fontSize(10)
        .fontColor('#4CAF50')

      Text('说明: 使用py脚本或手动持续移动遥杆')
        .fontSize(9)
        .fontColor(Color.Gray)

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
    .padding(6)
    .backgroundColor('#F5F5F5')
  }
}

