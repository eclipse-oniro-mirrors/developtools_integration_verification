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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0190
 * 用例描述: 使用手柄触发KeyEvent-intentionCode
 * 测试条件: 创建button组件，绑定onKeyEvent事件
 * 测试步骤: 1、使按钮获焦 2、按下手柄的按键
 * 预期结果: 打印按键的意图，上下左右打印1、2、3、4，A、B打印5、7，back打印9
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0190 {
  @Local testLog: string[] = [];
  @Local lastIntentionCode: string = '-';
  @Local lastKeyAction: string = '-';
  @Local eventCount: number = 0;
  @Local eventTriggered: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0190', log);
  }

  getIntentionCodeName(code: number): string {
    switch (code) {
      case 1: return '上(1)';
      case 2: return '下(2)';
      case 3: return '左(3)';
      case 4: return '右(4)';
      case 5: return 'A(5)';
      case 7: return 'B(7)';
      case 9: return 'Back(9)';
      default: return `其他(${code})`;
    }
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0190')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('使用手柄触发KeyEvent-intentionCode')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // intentionCode信息显示区域
      Column({ space: 4 }) {
        Text('IntentionCode信息:').fontSize(12).fontWeight(FontWeight.Bold)
        Text(`意图码: ${this.lastIntentionCode}`)
          .fontSize(16)
          .fontColor('#2196F3')
          .fontWeight(FontWeight.Bold)
        Text(`按键动作: ${this.lastKeyAction}`)
          .fontSize(12)
        Text(`事件次数: ${this.eventCount}`)
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // 参考表
      Column({ space: 2 }) {
        Text('IntentionCode对照表:').fontSize(10).fontWeight(FontWeight.Bold)
        Row() {
          Text('上:1 下:2 左:3 右:4').fontSize(9)
        }
        Row() {
          Text('A:5 B:7 Back:9').fontSize(9)
        }
      }
      .width('95%')
      .padding(4)
      .backgroundColor('#FFF8E1')
      .borderRadius(4)

      // 测试按钮
      Button('测试按钮 - 按下手柄按键')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.eventTriggered ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0190_Button')
        .focusable(true)
        .defaultFocus(true)
        .onKeyEvent((event: KeyEvent) => {
          this.eventTriggered = true;
          this.eventCount++;
          this.lastIntentionCode = this.getIntentionCodeName(event.intentionCode);
          this.lastKeyAction = event.type === KeyType.Down ? '按下' : '抬起';
          this.addLog(`intentionCode: ${event.intentionCode}, action: ${this.lastKeyAction}`);
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：').fontSize(11).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)

      Text('1. 连接手柄 2. 按钮获焦 3. 按下手柄按键(方向/A/B/Back)')
        .fontSize(10)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 打印对应按键的intentionCode')
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

