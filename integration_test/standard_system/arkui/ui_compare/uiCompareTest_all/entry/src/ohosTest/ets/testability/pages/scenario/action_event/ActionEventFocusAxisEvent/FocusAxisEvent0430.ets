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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0430
 * 用例描述: 组件设置enable为false（Modifier）
 * 测试条件: 创建button组件，使用Modifier方式绑定FocusAxisEvent，按RT键禁用
 * 测试步骤: 使子组件获焦，移动手柄遥杆rt
 * 预期结果: FocusAxisEvent事件响应不完全
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0430 {
  @Local testLog: string[] = [];
  @Local buttonEnabled: boolean = true;
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local disabledAfterEvents: number = 0;

  private focusAxisModifier: FocusAxisModifier0430 = new FocusAxisModifier0430((event: FocusAxisEvent) => {
    this.eventTriggered = true;
    this.eventCount++;
    if (!this.buttonEnabled) {
      this.disabledAfterEvents++;
      this.addLog(`[Modifier] 禁用后仍收到事件 - 异常！`);
    } else {
      this.addLog(`[Modifier] FocusAxisEvent触发 #${this.eventCount}`);
    }
  });

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0430', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0430')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('组件设置enable为false（Modifier）')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('组件状态 (Modifier):').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`按钮状态: ${this.buttonEnabled ? '启用' : '禁用'}`)
          .fontSize(14)
          .fontColor(this.buttonEnabled ? '#4CAF50' : '#F44336')
          .fontWeight(FontWeight.Bold)
        Text(`FocusAxisEvent触发次数: ${this.eventCount}`).fontSize(11).fontColor(Color.Gray)
        Text(`禁用后触发次数: ${this.disabledAfterEvents}`)
          .fontSize(11)
          .fontColor(this.disabledAfterEvents > 0 ? '#F44336' : '#4CAF50')
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

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

      Button('测试按钮 - 按RT键禁用')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.buttonEnabled ? '#2196F3' : '#BDBDBD')
        .enabled(this.buttonEnabled)
        .id('FocusAxisEvent0430_Button')
        .focusable(true)
        .defaultFocus(true)
        .attributeModifier(this.focusAxisModifier)
        .onKeyEvent((event: KeyEvent) => {
          if (event.keyCode === 2006 && event.type === KeyType.Down) {
            this.buttonEnabled = false;
            this.addLog('[Modifier] RT按键按下，按钮已禁用');
          }
        })

      Text('预期: 按RT后按钮禁用，事件响应不完全')
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

class FocusAxisModifier0430 implements AttributeModifier<ButtonAttribute> {
  private callback: (event: FocusAxisEvent) => void;
  constructor(callback: (event: FocusAxisEvent) => void) {
    this.callback = callback;
  }
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.onFocusAxisEvent(this.callback);
  }
}

