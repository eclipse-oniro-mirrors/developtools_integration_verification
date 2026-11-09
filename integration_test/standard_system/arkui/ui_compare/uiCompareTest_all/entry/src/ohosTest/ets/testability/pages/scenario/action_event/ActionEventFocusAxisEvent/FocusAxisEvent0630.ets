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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0630
 * 用例描述: 频繁移动手柄遥杆
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、频繁移动手柄遥杆5分钟
 * 预期结果: 事件能正常响应，手柄轴值打印正确
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0630 {
  @Local testLog: string[] = [];
  @Local absX: string = '-';
  @Local absY: string = '-';
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local startTime: number = 0;
  @Local elapsedTime: string = '0:00';
  @Local isRunning: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'FocusAxisEvent0630', log);
  }

  updateElapsedTime(): void {
    if (this.startTime > 0) {
      const elapsed = Math.floor((Date.now() - this.startTime) / 1000);
      const minutes = Math.floor(elapsed / 60);
      const seconds = elapsed % 60;
      this.elapsedTime = `${minutes}:${seconds.toString().padStart(2, '0')}`;
    }
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0630')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('频繁移动手柄遥杆（5分钟压力测试）')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('压力测试状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Row({ space: 20 }) {
          Text(`已运行: ${this.elapsedTime}`)
            .fontSize(14)
            .fontColor('#2196F3')
            .fontWeight(FontWeight.Bold)
          Text(`事件次数: ${this.eventCount}`)
            .fontSize(14)
            .fontColor('#4CAF50')
        }
        Row({ space: 20 }) {
          Text(`absX: ${this.absX}`).fontSize(12)
          Text(`absY: ${this.absY}`).fontSize(12)
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Row({ space: 10 }) {
        Button(this.isRunning ? '测试中...' : '开始测试')
          .width('40%')
          .height(35)
          .fontSize(12)
          .backgroundColor(this.isRunning ? '#FF9800' : '#4CAF50')
          .onClick(() => {
            if (!this.isRunning) {
              this.isRunning = true;
              this.startTime = Date.now();
              this.eventCount = 0;
              this.addLog('压力测试开始 - 请持续移动遥杆5分钟');
            }
          })
        Button('重置')
          .width('40%')
          .height(35)
          .fontSize(12)
          .backgroundColor('#9E9E9E')
          .onClick(() => {
            this.isRunning = false;
            this.startTime = 0;
            this.elapsedTime = '0:00';
            this.eventCount = 0;
            this.testLog = [];
            this.addLog('测试已重置');
          })
      }

      Button('测试按钮 - 频繁移动遥杆')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0630_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          this.updateElapsedTime();
          
          const axisMap = event.axisMap;
          if (axisMap) {
            this.absX = axisMap.get(AxisModel.ABS_X)?.toFixed(3) ?? '-';
            this.absY = axisMap.get(AxisModel.ABS_Y)?.toFixed(3) ?? '-';
          }
          
          if (this.eventCount % 100 === 0) {
            this.addLog(`事件 #${this.eventCount}: absX=${this.absX}, absY=${this.absY}`);
          }
        })

      Text('预期: 5分钟内事件正常响应，轴值正确')
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
    .padding(6)
    .backgroundColor('#F5F5F5')
  }
}

