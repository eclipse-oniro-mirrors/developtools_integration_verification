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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0047
 * @tc.desc: datePicker/datePickerDialog api隔离
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DatepickerVoice0047 {
  @Local testLog: string = '';
  @Local selectedDate: Date = new Date('2024-06-15');

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'DatepickerVoice0047', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - API隔离测试');
    this.addLog('验证api14和api16编译差异');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0047')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('DatePicker API隔离测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      DatePicker({
        start: new Date('2020-01-01'),
        end: new Date('2030-12-31'),
        selected: this.selectedDate
      })
        .id('date_picker')
        .lunar(false)
        .onChange((value: DatePickerResult) => {
          let month = value.month !== undefined ? value.month + 1 : 0;
          this.addLog('日期变化: ' + value.year + '-' + month + '-' + value.day);
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 用api14编译\n2. 用api16编译\n3. 期望: api14编译报错，api16编译生效')
        .fontSize(11)
        .fontColor('#666666')

      Text('API版本要求：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15 })

      Text('• API 14: 不支持此功能\n• API 16: 完整支持')
        .fontSize(11)
        .fontColor('#007DFF')

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
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

