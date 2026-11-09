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
 * @tc.name: SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0015
 * @tc.desc: datePicker/datePickerDialog参数输入string类型
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DatepickerVoice0015 {
  @Local testLog: string = '';
  @Local selectedDate: Date = new Date('2024-01-15');

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'DatepickerVoice0015', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 参数输入string类型测试');
    this.addLog('此用例验证参数类型检查');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_DATEPICKER_VOICE_0015')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('DatePicker参数类型验证')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('正确用法示例 (使用Date对象):')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      DatePicker({
        start: new Date('2020-01-01'),
        end: new Date('2030-12-31'),
        selected: this.selectedDate
      })
        .id('date_picker')
        .onChange((value: DatePickerResult) => {
          let month = value.month !== undefined ? value.month + 1 : 0;
          this.addLog('日期变化: ' + value.year + '-' + month + '-' + value.day);
        })

      Text('预期错误信息（输入string类型时）：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text("编译报错: Type 'string' is not assignable to type 'Date'")
        .fontSize(10)
        .fontColor(Color.Red)
        .margin({ top: 5 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 参数输入string类型编译\n2. 期望: 编译报错')
        .fontSize(11)
        .fontColor('#666666')

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

