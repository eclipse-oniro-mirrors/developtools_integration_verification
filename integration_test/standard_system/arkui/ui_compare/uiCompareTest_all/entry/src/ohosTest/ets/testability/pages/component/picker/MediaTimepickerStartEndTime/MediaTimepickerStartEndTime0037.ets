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

// 定义主题颜色接口
interface ThemeColors {
  backgroundColor: string;
  primaryTextColor: string;
  secondaryTextColor: string;
  buttonBackgroundColor: string;
  buttonTextColor: string;
  accentColor: string;
  cardBackgroundColor: string;
  borderColor: string;
}

@Entry
@Component
struct MediaTimepickerStartEndTime0037 {
  private selectedTime: Date = new Date('2024-12-20T12:30:00');
  @State isDarkMode: boolean = false;

  // 切换深浅色模式
  private toggleTheme() {
    this.isDarkMode = !this.isDarkMode;
    console.info(`切换主题模式: ${this.isDarkMode ? '深色' : '浅色'}，时间选择范围保持: 09:00:00 - 18:00:00`);
  }

  // 获取主题相关颜色
  private getThemeColors(): ThemeColors {
    return {
      backgroundColor: this.isDarkMode ? '#1C1C1E' : '#FFFFFF',
      primaryTextColor: this.isDarkMode ? '#FFFFFF' : '#000000',
      secondaryTextColor: this.isDarkMode ? '#EBEBF5' : '#8E8E93',
      buttonBackgroundColor: this.isDarkMode ? '#0A84FF' : '#007AFF',
      buttonTextColor: '#FFFFFF',
      accentColor: this.isDarkMode ? '#0A84FF' : '#007AFF',
      cardBackgroundColor: this.isDarkMode ? '#2C2C2E' : '#F2F2F7',
      borderColor: this.isDarkMode ? '#38383A' : '#C6C6C8'
    } as ThemeColors;
  }

  build() {
    Column() {
      Text('深浅色主题适配测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.getThemeColors().primaryTextColor)
        .margin({ bottom: 20 })

      Text(`当前主题: ${this.isDarkMode ? '深色模式' : '浅色模式'}`)
        .fontSize(14)
        .fontColor(this.getThemeColors().secondaryTextColor)
        .margin({ bottom: 20 })

      // 主题切换按钮
      Button(this.isDarkMode ? '切换到浅色模式' : '切换到深色模式')
        .width('60%')
        .height(50)
        .fontSize(16)
        .backgroundColor(this.getThemeColors().buttonBackgroundColor)
        .fontColor(this.getThemeColors().buttonTextColor)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.toggleTheme();
        })

      // TimePicker容器
      Column() {
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
              console.info(`${this.isDarkMode ? '深色' : '浅色'}模式，时间选择范围: 09:00:00 - 18:00:00`);
            }
          })
          .width('100%')
      }
      .width('100%')
      .padding(20)
      .backgroundColor(this.getThemeColors().cardBackgroundColor)
      .borderRadius(12)
      .margin({ bottom: 20 })
      .layoutWeight(1)

      Button('TimePickerDialog')
        .width('60%')
        .height(50)
        .fontSize(16)
        .backgroundColor(this.getThemeColors().buttonBackgroundColor)
        .fontColor(this.getThemeColors().buttonTextColor)
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
                console.info(`${this.isDarkMode ? '深色' : '浅色'}模式，时间选择范围: 09:00:00 - 18:00:00`);
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()');
            }
          });
        })

      Text('时间选择范围: 09:00:00 - 18:00:00')
        .fontSize(14)
        .fontColor(this.getThemeColors().accentColor)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 10, bottom: 20 })

      Text(this.isDarkMode ? '深色模式：护眼配色，适合夜间使用' : '浅色模式：清爽配色，适合日间使用')
        .fontSize(12)
        .fontColor(this.getThemeColors().secondaryTextColor)
        .textAlign(TextAlign.Center)
        .lineHeight(18)
        .margin({ bottom: 20 })

      Text('说明: 深浅色切换时，时间选择范围保持不变')
        .fontSize(12)
        .fontColor(this.getThemeColors().secondaryTextColor)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(this.getThemeColors().backgroundColor)
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}