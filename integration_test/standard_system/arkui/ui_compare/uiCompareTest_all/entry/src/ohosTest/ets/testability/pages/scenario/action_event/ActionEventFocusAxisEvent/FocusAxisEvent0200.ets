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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0200
 * 用例描述: KeyEvent和onKeyPreIme同时使用
 * 测试条件: 创建button组件，绑定KeyEvent和onKeyPreIme，在onKeyPreIme拦截手柄按键A、B、X、Y
 * 测试步骤: 1、使按钮获焦 2、按下手柄按键：A、B、X、Y
 * 预期结果: 按下手柄按键A、B、X、Y，KeyEvent不触发
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct FocusAxisEvent0200 {
  @Local testLog: string[] = [];
  @Local keyEventTriggered: boolean = false;
  @Local keyPreImeTriggered: boolean = false;
  @Local keyEventCount: number = 0;
  @Local keyPreImeCount: number = 0;
  @Local lastInterceptedKey: string = '-';
  @Local testPassed: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'FocusAxisEvent0200', log);
  }

  isGamepadABXY(keyCode: number): boolean {
    // 手柄A、B、X、Y按键的keyCode
    return keyCode === 2000 || keyCode === 2001 || keyCode === 2002 || keyCode === 2003;
  }

  getKeyName(keyCode: number): string {
    switch (keyCode) {
      case 2000: return 'A';
      case 2001: return 'B';
      case 2002: return 'X';
      case 2003: return 'Y';
      default: return `Key(${keyCode})`;
    }
  }

  build() {
    Column({ space: 6 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0200')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('KeyEvent和onKeyPreIme同时使用')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      // 状态显示区域
      Column({ space: 4 }) {
        Text('事件触发状态:').fontSize(12).fontWeight(FontWeight.Bold)
        Row({ space: 20 }) {
          Column() {
            Text('onKeyPreIme')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
            Text(`触发: ${this.keyPreImeTriggered ? '是' : '否'}`)
              .fontSize(12)
              .fontColor(this.keyPreImeTriggered ? '#4CAF50' : '#999999')
            Text(`次数: ${this.keyPreImeCount}`)
              .fontSize(10)
              .fontColor(Color.Gray)
          }
          Column() {
            Text('onKeyEvent')
              .fontSize(11)
              .fontWeight(FontWeight.Bold)
            Text(`触发: ${this.keyEventTriggered ? '是' : '否'}`)
              .fontSize(12)
              .fontColor(this.keyEventTriggered ? '#F44336' : '#4CAF50')
            Text(`次数: ${this.keyEventCount}`)
              .fontSize(10)
              .fontColor(Color.Gray)
          }
        }
        Text(`拦截的按键: ${this.lastInterceptedKey}`)
          .fontSize(11)
          .fontColor('#2196F3')
        if (this.testPassed) {
          Text('✓ 验证通过：A/B/X/Y被拦截，KeyEvent未触发')
            .fontSize(11)
            .fontColor('#4CAF50')
        }
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      // 测试按钮
      Button('测试按钮 - 按下手柄A/B/X/Y')
        .width('80%')
        .height(50)
        .fontSize(14)
        .backgroundColor(this.testPassed ? '#4CAF50' : '#2196F3')
        .id('FocusAxisEvent0200_Button')
        .focusable(true)
        .defaultFocus(true)
        .onKeyPreIme((event: KeyEvent): boolean => {
          if (this.isGamepadABXY(event.keyCode)) {
            this.keyPreImeTriggered = true;
            this.keyPreImeCount++;
            this.lastInterceptedKey = this.getKeyName(event.keyCode);
            this.addLog(`onKeyPreIme拦截: ${this.lastInterceptedKey}`);
            return true; // 拦截，不传递给KeyEvent
          }
          return false;
        })
        .onKeyEvent((event: KeyEvent) => {
          if (this.isGamepadABXY(event.keyCode)) {
            this.keyEventTriggered = true;
            this.keyEventCount++;
            this.addLog(`onKeyEvent触发: ${this.getKeyName(event.keyCode)} - 不应该触发！`);
          } else {
            this.addLog(`onKeyEvent触发: ${this.getKeyName(event.keyCode)}`);
          }
        })

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：').fontSize(11).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)

      Text('1. 连接手柄 2. 按钮获焦 3. 按A/B/X/Y键\n4. 观察onKeyPreIme拦截，KeyEvent不触发')
        .fontSize(10)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: A/B/X/Y按键被onKeyPreIme拦截，KeyEvent不触发')
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

