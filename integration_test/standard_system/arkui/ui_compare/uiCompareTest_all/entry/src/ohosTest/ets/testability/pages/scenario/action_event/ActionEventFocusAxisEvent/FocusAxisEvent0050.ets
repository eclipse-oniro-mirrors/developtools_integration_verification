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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0050
 * 用例描述: 使用手柄触发FocusAxisEvent-getModifierKeyState
 * 测试条件: 创建button组件，绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆 3、按下组合键
 * 预期结果: 打印对应的组合键状态
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0050 {
  @Local testLog: string[] = [];
  @Local modifierKeyState: string = '-';
  @Local ctrlState: boolean = false;
  @Local altState: boolean = false;
  @Local shiftState: boolean = false;
  @Local fnState: boolean = false;
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0050', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0050')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('使用手柄触发FocusAxisEvent-getModifierKeyState')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 组合键状态显示区域
      Column({ space: 4 }) {
        Text('ModifierKeyState信息:').fontSize(12).fontWeight(FontWeight.Bold)
        Row({ space: 10 }) {
          Text(`Ctrl: ${this.ctrlState}`)
            .fontSize(11)
            .fontColor(this.ctrlState ? '#4CAF50' : '#999999')
          Text(`Alt: ${this.altState}`)
            .fontSize(11)
            .fontColor(this.altState ? '#4CAF50' : '#999999')
        }
        Row({ space: 10 }) {
          Text(`Shift: ${this.shiftState}`)
            .fontSize(11)
            .fontColor(this.shiftState ? '#4CAF50' : '#999999')
          Text(`Fn: ${this.fnState}`)
            .fontSize(11)
            .fontColor(this.fnState ? '#4CAF50' : '#999999')
        }
        Text(`事件触发次数: ${this.eventCount}`)
          .fontSize(11)
          .fontColor(Color.Gray)
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
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0050_Button')
        .focusable(true)
        .defaultFocus(true)
        .onFocusAxisEvent((event: FocusAxisEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          
          // 检查各个组合键状态
          try {
            if (event.getModifierKeyState) {
              this.ctrlState = event.getModifierKeyState(['Ctrl']);
              this.altState = event.getModifierKeyState(['Alt']);
              this.shiftState = event.getModifierKeyState(['Shift']);
              this.fnState = event.getModifierKeyState(['Fn']);
            }
            
            let activeKeys: string[] = [];
            if (this.ctrlState) {
              activeKeys.push('Ctrl');
            }
            if (this.altState) {
              activeKeys.push('Alt');
            }
            if (this.shiftState) {
              activeKeys.push('Shift');
            }
            if (this.fnState) {
              activeKeys.push('Fn');
            }
            
            this.modifierKeyState = activeKeys.length > 0 ? activeKeys.join('+') : '无';
            this.addLog(`ModifierKeyState: ${this.modifierKeyState}`);
          } catch (e) {
            this.addLog(`获取ModifierKeyState异常: ${e}`);
          }
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 连接手柄设备和键盘\n2. 确保按钮已获焦\n3. 按住Ctrl/Alt/Shift/Fn的组合\n4. 同时移动手柄遥杆\n5. 观察组合键状态')
        .fontSize(10)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 打印对应的组合键状态')
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

