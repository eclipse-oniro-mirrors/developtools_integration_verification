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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0080
 * 用例描述: 使用手柄触发FocusAxisEvent-子组件设置stopPropagation
 * 测试条件: 创建父组件column绑定FocusAxisEvent，子组件button绑定FocusAxisEvent并使用stopPropagation
 * 测试步骤: 1、使按钮获焦 2、移动手柄的遥杆
 * 预期结果: 只有子组件的FocusAxisEvent事件触发
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0080 {
  @Local testLog: string[] = [];
  @Local parentTriggered: boolean = false;
  @Local childTriggered: boolean = false;
  @Local parentCount: number = 0;
  @Local childCount: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0080', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0080')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('子组件设置stopPropagation')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 状态显示区域
      Column({ space: 4 }) {
        Text('事件触发状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Row({ space: 20 }) {
          Column() {
            Text('父组件(Column)')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
            Text(`触发: ${this.parentTriggered ? '是' : '否'}`)
              .fontSize(12)
              .fontColor(this.parentTriggered ? '#F44336' : '#4CAF50')
            Text(`次数: ${this.parentCount}`)
              .fontSize(10)
              .fontColor(Color.Gray)
          }
          Column() {
            Text('子组件(Button)')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
            Text(`触发: ${this.childTriggered ? '是' : '否'}`)
              .fontSize(12)
              .fontColor(this.childTriggered ? '#4CAF50' : '#999999')
            Text(`次数: ${this.childCount}`)
              .fontSize(10)
              .fontColor(Color.Gray)
          }
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Divider().height(1).color('#EEEEEE')

      // 父组件 - 绑定FocusAxisEvent
      Column({ space: 10 }) {
        Text('父组件区域 (Column)')
          .fontSize(12)
          .fontColor('#666666')

        // 子组件 - 绑定FocusAxisEvent并使用stopPropagation
        Button('子组件按钮 - stopPropagation')
          .width('90%')
          .height(60)
          .fontSize(14)
          .backgroundColor(this.childTriggered ? '#4CAF50' : '#2196F3')
          .id('FocusAxisEvent0080_ChildButton')
          .focusable(true)
          .defaultFocus(true)
          .onFocusAxisEvent((event: FocusAxisEvent) => {
            this.childTriggered = true;
            this.childCount++;
            event.stopPropagation();
            this.addLog(`子组件触发 - 已调用stopPropagation`);
          })
      }
      .width('95%')
      .height('9.84%')
      .backgroundColor('#FFF3E0')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .onFocusAxisEvent((event: FocusAxisEvent) => {
        this.parentTriggered = true;
        this.parentCount++;
        this.addLog(`父组件触发`);
      })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 连接手柄设备\n2. 确保子按钮已获焦\n3. 移动手柄遥杆\n4. 观察事件触发状态')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 只有子组件FocusAxisEvent事件触发，父组件不触发')
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
      .height('6.56%')
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

