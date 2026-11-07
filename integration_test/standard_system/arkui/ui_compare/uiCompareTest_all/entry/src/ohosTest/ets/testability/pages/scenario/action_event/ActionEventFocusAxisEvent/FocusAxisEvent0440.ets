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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0440
 * 用例描述: 横竖屏切换（Modifier）
 * 测试条件: 打开测试demo
 * 测试步骤: 1、进行横竖屏切换 2、使子组件获焦，移动手柄遥杆
 * 预期结果: 手柄轴值打印正确
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0440 {
  @Local testLog: string[] = [];
  @Local absX: string = '-';
  @Local absY: string = '-';
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;
  @Local orientation: string = '竖屏';

  private focusAxisModifier: FocusAxisModifier0440 = new FocusAxisModifier0440((event: FocusAxisEvent) => {
    this.eventTriggered = true;
    this.eventCount++;
    
    const axisMap = event.axisMap;
    if (axisMap) {
      this.absX = axisMap.get(AxisModel.ABS_X)?.toFixed(3) ?? '-';
      this.absY = axisMap.get(AxisModel.ABS_Y)?.toFixed(3) ?? '-';
      this.addLog(`[Modifier][${this.orientation}] absX=${this.absX}, absY=${this.absY}`);
    }
  });

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0440', log);
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0440')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('横竖屏切换（Modifier）')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('屏幕方向与轴值 (Modifier):').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`当前方向: ${this.orientation}`)
          .fontSize(14)
          .fontColor('#2196F3')
          .fontWeight(FontWeight.Bold)
        Row({ space: 20 }) {
          Text(`absX: ${this.absX}`).fontSize(12)
          Text(`absY: ${this.absY}`).fontSize(12)
        }
        Text(`事件触发次数: ${this.eventCount}`).fontSize(11).fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      Row({ space: 10 }) {
        Button('竖屏')
          .width('40%')
          .height(35)
          .fontSize(12)
          .backgroundColor(this.orientation === '竖屏' ? '#4CAF50' : '#9E9E9E')
          .onClick(() => {
            this.orientation = '竖屏';
            this.addLog('[Modifier] 切换到竖屏模式');
          })
        Button('横屏')
          .width('40%')
          .height(35)
          .fontSize(12)
          .backgroundColor(this.orientation === '横屏' ? '#4CAF50' : '#9E9E9E')
          .onClick(() => {
            this.orientation = '横屏';
            this.addLog('[Modifier] 切换到横屏模式');
          })
      }

      Button('测试按钮 - Modifier方式')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0440_Button')
        .focusable(true)
        .defaultFocus(true)
        .attributeModifier(this.focusAxisModifier)

      Text('预期: 横竖屏切换后，Modifier方式获取轴值正确')
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

class FocusAxisModifier0440 implements AttributeModifier<ButtonAttribute> {
  private callback: (event: FocusAxisEvent) => void;
  constructor(callback: (event: FocusAxisEvent) => void) {
    this.callback = callback;
  }
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.onFocusAxisEvent(this.callback);
  }
}

