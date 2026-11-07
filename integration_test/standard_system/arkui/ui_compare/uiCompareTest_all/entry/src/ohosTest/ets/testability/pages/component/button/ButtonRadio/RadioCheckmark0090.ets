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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RADIO_CHECKMARK_0090
 * @tc.desc: Radio为勾选类型未选中，focus态
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RadioCheckmark0090 {
  @Local testLog: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RadioCheckmark0090', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RADIO_CHECKMARK_0090')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('勾选类型的Radio未选中，focus状态')
        .fontSize(12)
        .margin({ bottom: 10 })

      Row() {
        Radio({ value: 'Radio1', group: 'group1' })
          .checked(false)
          .width(30)
          .height(30)
          .id('radio_tick_unchecked_focus')
          .focusable(true)
          .onChange((isChecked: boolean) => {
            this.addLog('Radio1 checked: ' + isChecked);
          })
          .onFocus(() => {
            this.addLog('Radio1 focused');
          })
          .onBlur(() => {
            this.addLog('Radio1 blur');
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .padding(20)

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 使用键盘Tab键使Radio获得焦点\n2. Radio应为勾选类型且未选中\n3. 状态应为focus态')
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
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
