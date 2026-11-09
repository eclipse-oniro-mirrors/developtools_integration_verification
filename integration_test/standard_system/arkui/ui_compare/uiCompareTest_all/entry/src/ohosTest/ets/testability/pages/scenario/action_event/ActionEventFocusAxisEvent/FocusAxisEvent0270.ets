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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0270
 * 用例描述: 使用手柄触发FocusAxisEvent-getModifierKeyState（Modifier）
 * 测试条件: 创建button组件，使用Modifier方式绑定FocusAxisEvent事件
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆 3、按下组合键
 * 预期结果: 打印对应的组合键状态
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0270 {
  @Local testLog: string[] = [];
  @Local modifierKeyState: string = '-';
  @Local ctrlState: boolean = false;
  @Local altState: boolean = false;
  @Local shiftState: boolean = false;
  @Local fnState: boolean = false;
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;

  private focusAxisModifier: FocusAxisEventModifier0270 = new FocusAxisEventModifier0270((event: FocusAxisEvent) => {
    this.eventTriggered = true;
    this.eventCount++;
    
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
      this.addLog(`[Modifier] ModifierKeyState: ${this.modifierKeyState}`);
    } catch (e) {
      this.addLog(`[Modifier] 获取ModifierKeyState异常: ${e}`);
    }
  });

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0270', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0270')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('FocusAxisEvent-getModifierKeyState（Modifier）')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 组合键状态显示区域
      Column({ space: 4 }) {
        Text('ModifierKeyState (Modifier):').fontSize(11).fontWeight(FontWeight.Bold)
        Row({ space: 10 }) {
          Text(`Ctrl: ${this.ctrlState}`)
            .fontSize(10)
            .fontColor(this.ctrlState ? '#4CAF50' : '#999999')
          Text(`Alt: ${this.altState}`)
            .fontSize(10)
            .fontColor(this.altState ? '#4CAF50' : '#999999')
        }
        Row({ space: 10 }) {
          Text(`Shift: ${this.shiftState}`)
            .fontSize(10)
            .fontColor(this.shiftState ? '#4CAF50' : '#999999')
          Text(`Fn: ${this.fnState}`)
            .fontSize(10)
            .fontColor(this.fnState ? '#4CAF50' : '#999999')
        }
        Text(`事件次数: ${this.eventCount}`)
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      // 测试按钮 - 使用Modifier方式
      Button('测试按钮 - Modifier方式')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0270_Button')
        .focusable(true)
        .defaultFocus(true)
        .attributeModifier(this.focusAxisModifier)

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：').fontSize(11).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)

      Text('1. 连接手柄和键盘 2. 按钮获焦\n3. 按组合键+移动遥杆 4. 观察状态')
        .fontSize(10)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 使用Modifier方式获取组合键状态正确')
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

class FocusAxisEventModifier0270 implements AttributeModifier<ButtonAttribute> {
  private callback: (event: FocusAxisEvent) => void;

  constructor(callback: (event: FocusAxisEvent) => void) {
    this.callback = callback;
  }

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.onFocusAxisEvent(this.callback);
  }
}

