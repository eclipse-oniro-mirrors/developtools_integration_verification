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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0210
 * 用例描述: 组件动态设置enable为false
 * 测试条件: 创建button组件，绑定FocusAxisEvent和onKeyEvent，按下rt按键时设置enable为false
 * 测试步骤: 使子组件获焦，移动手柄遥杆rt
 * 预期结果: FocusAxisEvent事件响应不完全
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0210 {
  @Local testLog: string[] = [];
  @Local buttonEnabled: boolean = true;
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local disabledAfterEvents: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0210', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0210')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('组件动态设置enable为false')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 状态显示区域
      Column({ space: 4 }) {
        Text('组件状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Row({ space: 20 }) {
          Text(`按钮状态: ${this.buttonEnabled ? '启用' : '禁用'}`)
            .fontSize(14)
            .fontColor(this.buttonEnabled ? '#4CAF50' : '#F44336')
            .fontWeight(FontWeight.Bold)
        }
        Text(`FocusAxisEvent触发次数: ${this.eventCount}`)
          .fontSize(11)
          .fontColor(Color.Gray)
        Text(`禁用后触发次数: ${this.disabledAfterEvents}`)
          .fontSize(11)
          .fontColor(this.disabledAfterEvents > 0 ? '#F44336' : '#4CAF50')
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // 重置按钮
      Button('重置测试')
        .width('40%')
        .height(35)
        .fontSize(12)
        .backgroundColor('#FF9800')
        .onClick(() => {
          this.buttonEnabled = true;
          this.eventCount = 0;
          this.disabledAfterEvents = 0;
          this.eventTriggered = false;
          this.testLog = [];
          this.addLog('测试已重置');
        })

      // 测试按钮
      Button('测试按钮 - 按RT键禁用')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.buttonEnabled ? '#2196F3' : '#BDBDBD')
        .enabled(this.buttonEnabled)
        .id('FocusAxisEvent0210_Button')
        .focusable(true)
        .defaultFocus(true)
        .onKeyEvent((event: KeyEvent) => {
          // 检测RT按键（右扳机）
          if (event.keyCode === 2006 && event.type === KeyType.Down) {
            this.buttonEnabled = false;
            this.addLog('RT按键按下，按钮已禁用');
          }
        })
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          if (!this.buttonEnabled) {
            this.disabledAfterEvents++;
            this.addLog(`禁用后仍收到事件 - 异常！`);
          } else {
            this.addLog(`FocusAxisEvent触发 #${this.eventCount}`);
          }
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：').fontSize(11).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)

      Text('1. 连接手柄 2. 按钮获焦 3. 移动遥杆触发事件\n4. 按RT键禁用按钮 5. 继续移动遥杆观察')
        .fontSize(10)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 按RT后按钮禁用，FocusAxisEvent响应不完全')
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

