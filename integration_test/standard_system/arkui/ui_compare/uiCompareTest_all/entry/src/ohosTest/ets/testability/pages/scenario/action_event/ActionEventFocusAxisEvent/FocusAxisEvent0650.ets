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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0650
 * 用例描述: FocusAxisEvent事件内存泄漏测试
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件
 * 测试步骤: 1、编写py脚本 2、运行内存泄漏测试
 * 预期结果: 内存泄漏不超过500kb
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0650 {
  @Local testLog: string[] = [];
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local memoryInfo: string = '待测试';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'FocusAxisEvent0650', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0650')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('FocusAxisEvent事件内存泄漏测试')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('内存泄漏测试状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`事件触发次数: ${this.eventCount}`)
          .fontSize(14)
          .fontColor('#2196F3')
        Text(`内存状态: ${this.memoryInfo}`)
          .fontSize(12)
          .fontColor(Color.Gray)
        Text('阈值: 内存泄漏不超过500KB')
          .fontSize(11)
          .fontColor('#FF9800')
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Button('重置测试')
        .width('40%')
        .height(35)
        .fontSize(12)
        .backgroundColor('#FF9800')
        .onClick(() => {
          this.eventCount = 0;
          this.eventTriggered = false;
          this.memoryInfo = '待测试';
          this.testLog = [];
          this.addLog('测试已重置');
        })

      Button('测试按钮 - 内存泄漏检测')
        .width('80%')
        .height(60)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0650_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          
          // 获取axisMap用于测试内存
          const axisMap = event.axisMap;
          if (axisMap) {
            const absX = axisMap.get(AxisModel.ABS_X)?.toFixed(3) ?? '-';
            const absY = axisMap.get(AxisModel.ABS_Y)?.toFixed(3) ?? '-';
          }
          
          if (this.eventCount % 100 === 0) {
            this.addLog(`事件 #${this.eventCount} - 持续监测内存`);
          }
        })

      Text('预期: 内存泄漏不超过500KB')
        .fontSize(10)
        .fontColor('#4CAF50')

      Column({ space: 2 }) {
        Text('测试说明:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('1. 使用py脚本持续触发事件').fontSize(9).fontColor(Color.Gray)
        Text('2. 通过hdc shell获取进程内存').fontSize(9).fontColor(Color.Gray)
        Text('3. 对比测试前后内存差值').fontSize(9).fontColor(Color.Gray)
      }
      .width('95%')
      .padding(4)
      .backgroundColor('#FFF8E1')
      .borderRadius(4)

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
    .padding(6)
    .backgroundColor('#F5F5F5')
  }
}

