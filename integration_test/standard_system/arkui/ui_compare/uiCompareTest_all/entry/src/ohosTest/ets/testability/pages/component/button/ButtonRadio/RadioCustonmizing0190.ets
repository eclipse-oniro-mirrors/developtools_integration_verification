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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RADIO_CUSTONMIZING_0190
 * @tc.desc: 在预览器上查看Radio自定义样式，预览器显示正常
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RadioCustonmizing0190 {
  @Local testLog: string = '';
  @Local customText: string = 'Hi';
  @Local isChecked: boolean = true;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RadioCustonmizing0190', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RADIO_CUSTONMIZING_0190')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Radio自定义样式预览')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Text('Radio1 (红色圆圈 + "' + this.customText + '" 按钮):')
          .fontSize(12)
          .margin({ bottom: 5 })

        Row() {
          Circle()
            .width(20)
            .height(20)
            .fill(this.isChecked ? Color.Red : Color.Gray)
            .stroke(Color.Red)
            .strokeWidth(2)
          Button(this.customText)
            .fontSize(12)
            .height(24)
            .borderRadius(12)
            .margin({ left: 8 })
            .onClick(() => {
              this.isChecked = !this.isChecked;
              this.addLog('Radio clicked, checked: ' + this.isChecked);
            })
        }
        .id('radio_custom_1')
        .width('100%')
        .padding(10)

        Button('点击切换为 "Hello"')
          .fontSize(12)
          .id('btn_switch')
          .onClick(() => {
            this.customText = 'Hello';
            this.addLog('Switched text to Hello');
          })
          .margin({ top: 10 })
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. Radio1显示红色圆圈和"Hi"按钮\n2. 点击按钮后切换为"Hello"')
        .fontSize(11)
        .fontColor('#666666')

      Text('日志:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
