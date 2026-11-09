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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0300
 * 用例描述: 使用手柄触发FocusAxisEvent-子组件设置stopPropagation（Modifier）
 * 测试条件: 创建父子组件，子组件使用Modifier方式绑定FocusAxisEvent并使用stopPropagation
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆
 * 预期结果: 只有子组件的FocusAxisEvent事件触发
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0300 {
  @Local testLog: string[] = [];
  @Local parentTriggered: boolean = false;
  @Local childTriggered: boolean = false;
  @Local parentCount: number = 0;
  @Local childCount: number = 0;

  private childModifier: ChildFocusAxisModifier0300 = new ChildFocusAxisModifier0300((event: FocusAxisEvent) => {
    this.childTriggered = true;
    this.childCount++;
    event.stopPropagation();
    this.addLog(`[Modifier] 子组件触发 - 已调用stopPropagation`);
  });

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0300', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0300')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('子组件设置stopPropagation（Modifier）')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 状态显示区域
      Column({ space: 4 }) {
        Text('事件触发状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Row({ space: 20 }) {
          Column() {
            Text('父组件').fontSize(11).fontWeight(FontWeight.Bold)
            Text(`触发: ${this.parentTriggered ? '是' : '否'}`)
              .fontSize(12)
              .fontColor(this.parentTriggered ? '#F44336' : '#4CAF50')
            Text(`次数: ${this.parentCount}`).fontSize(10).fontColor(Color.Gray)
          }
          Column() {
            Text('子组件(Modifier)').fontSize(11).fontWeight(FontWeight.Bold)
            Text(`触发: ${this.childTriggered ? '是' : '否'}`)
              .fontSize(12)
              .fontColor(this.childTriggered ? '#4CAF50' : '#999999')
            Text(`次数: ${this.childCount}`).fontSize(10).fontColor(Color.Gray)
          }
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      // 父组件
      Column({ space: 10 }) {
        Text('父组件区域').fontSize(12).fontColor('#666666')
        
        Button('子组件按钮 - Modifier+stopPropagation')
          .width('90%')
          .height(50)
          .fontSize(12)
          .backgroundColor(this.childTriggered ? '#4CAF50' : '#2196F3')
          .id('FocusAxisEvent0300_ChildButton')
          .focusable(true)
          .defaultFocus(true)
          .attributeModifier(this.childModifier)
      }
      .width('95%')
      .height('8.2%')
      .backgroundColor('#FFF3E0')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .onFocusAxisEvent((event: FocusAxisEvent) => {
        this.parentTriggered = true;
        this.parentCount++;
        this.addLog(`父组件触发`);
      })

      Text('预期: 只有子组件触发，父组件不触发')
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

class ChildFocusAxisModifier0300 implements AttributeModifier<ButtonAttribute> {
  private callback: (event: FocusAxisEvent) => void;
  constructor(callback: (event: FocusAxisEvent) => void) {
    this.callback = callback;
  }
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.onFocusAxisEvent(this.callback);
  }
}

