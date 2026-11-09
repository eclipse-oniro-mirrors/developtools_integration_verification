/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// 定义语言文本接口
interface LanguageTexts {
  title: string;
  currentLanguage: string;
  switchButton: string;
  timePickerButton: string;
  timeRange: string;
  description: string;
  note: string;
}

@Entry
@Component
struct MediaTimepickerStartEndTime0038 {
  private selectedTime: Date = new Date('2024-12-20T12:30:00');
  @State isEnglish: boolean = false;

  // 切换语言
  private toggleLanguage() {
    this.isEnglish = !this.isEnglish;
    console.info(`切换语言: ${this.isEnglish ? 'English' : '中文'}，时间选择范围保持: 09:00:00 - 18:00:00`);
  }

  // 获取当前语言的文本
  private getLanguageTexts(): LanguageTexts {
    if (this.isEnglish) {
      return {
        title: 'Language Adaptation Test',
        currentLanguage: 'Current Language: English',
        switchButton: 'Switch to Chinese',
        timePickerButton: 'TimePickerDialog',
        timeRange: 'Time Range: 09:00:00 - 18:00:00',
        description: 'English Mode: Interface adapted for English users',
        note: 'Note: Time selection range remains unchanged when switching languages'
      } as LanguageTexts;
    } else {
      return {
        title: '语言适配测试',
        currentLanguage: '当前语言: 中文',
        switchButton: '切换到英文',
        timePickerButton: '时间选择对话框',
        timeRange: '时间选择范围: 09:00:00 - 18:00:00',
        description: '中文模式：界面适配中文用户',
        note: '说明: 切换语言时，时间选择范围保持不变'
      } as LanguageTexts;
    }
  }

  build() {
    Column() {
      Text(this.getLanguageTexts().title)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.getLanguageTexts().currentLanguage)
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      // 语言切换按钮
      Button(this.getLanguageTexts().switchButton)
        .width('60%')
        .height(50)
        .fontSize(16)
        .backgroundColor('#007AFF')
        .fontColor('#FFFFFF')
        .margin({ bottom: 20 })
        .onClick(() => {
          this.toggleLanguage();
        })

      TimePicker({
        selected: this.selectedTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND,
        start: new Date('2024-12-20T09:00:00'), // 正常开始时间：09:00:00
        end: new Date('2024-12-20T18:00:00')    // 正常结束时间：18:00:00
      })
        .dateTimeOptions({ hour: 'numeric', minute: '2-digit', second: '2-digit' })
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute, value.second);
            console.info('TimePicker选择时间: ' + JSON.stringify(value));
            console.info(`${this.isEnglish ? 'English' : '中文'}模式，时间选择范围: 09:00:00 - 18:00:00`);
          }
        })
        .width('100%')
        .layoutWeight(1)

      Button(this.getLanguageTexts().timePickerButton)
        .width('60%')
        .height(50)
        .fontSize(16)
        .backgroundColor('#007AFF')
        .fontColor('#FFFFFF')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: false,
            selected: this.selectedTime,
            format: TimePickerFormat.HOUR_MINUTE_SECOND,
            start: new Date('2024-12-20T09:00:00'), // 正常开始时间：09:00:00
            end: new Date('2024-12-20T18:00:00'),   // 正常结束时间：18:00:00
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined && value.second != undefined) {
                this.selectedTime.setHours(value.hour, value.minute, value.second);
                console.info('TimePickerDialog:onAccept() ' + JSON.stringify(value));
                console.info(`${this.isEnglish ? 'English' : '中文'}模式，时间选择范围: 09:00:00 - 18:00:00`);
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()');
            }
          });
        })

      Text(this.getLanguageTexts().timeRange)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 10, bottom: 20 })

      Text(this.getLanguageTexts().description)
        .fontSize(12)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .lineHeight(18)
        .margin({ bottom: 20 })

      Text(this.getLanguageTexts().note)
        .fontSize(12)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}