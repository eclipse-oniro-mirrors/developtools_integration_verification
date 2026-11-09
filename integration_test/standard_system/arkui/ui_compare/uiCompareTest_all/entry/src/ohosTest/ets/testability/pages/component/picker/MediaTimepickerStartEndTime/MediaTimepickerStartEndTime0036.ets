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

@Entry
@Component
struct MediaTimepickerStartEndTime0036 {
  private selectedTime: Date = new Date('2024-12-20T12:30:00');
  @State orientation: string = 'portrait';
  @State isElderlyMode: boolean = false;

  // 切换适老化模式
  private toggleElderlyMode() {
    this.isElderlyMode = !this.isElderlyMode;
    console.info(`切换适老化模式: ${this.isElderlyMode ? '开启' : '关闭'}，时间选择范围保持: 09:00:00 - 18:00:00`);
  }

  build() {
    Column() {
      Text('适老化适配测试')
        .fontSize(this.isElderlyMode ? 24 : 18)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.isElderlyMode ? '#000000' : '#333333')
        .margin({ bottom: this.isElderlyMode ? 30 : 20 })

      Text(`当前屏幕方向: ${this.orientation}`)
        .fontSize(this.isElderlyMode ? 18 : 14)
        .fontColor(this.isElderlyMode ? '#333333' : Color.Gray)
        .margin({ bottom: this.isElderlyMode ? 20 : 10 })

      // 适老化模式切换按钮
      Button(this.isElderlyMode ? '关闭适老化模式' : '开启适老化模式')
        .width(this.isElderlyMode ? '80%' : '60%')
        .height(this.isElderlyMode ? 60 : 50)
        .fontSize(this.isElderlyMode ? 18 : 16)
        .backgroundColor(this.isElderlyMode ? '#0A59F7' : '#007DFF')
        .fontColor('#FFFFFF')
        .margin({ bottom: this.isElderlyMode ? 30 : 20 })
        .onClick(() => {
          this.toggleElderlyMode();
        })

      TimePicker({
        selected: this.selectedTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND,
        start: new Date('2024-12-20T09:00:00'), // 正常开始时间：09:00:00
        end: new Date('2024-12-20T18:00:00')    // 正常结束时间：18:00:00
      })
        .dateTimeOptions({ 
          hour: 'numeric', 
          minute: '2-digit', 
          second: '2-digit'
        })
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute, value.second);
            console.info('TimePicker选择时间: ' + JSON.stringify(value));
            console.info(`适老化模式${this.isElderlyMode ? '开启' : '关闭'}，时间选择范围: 09:00:00 - 18:00:00`);
          }
        })
        .width('100%')
        .height(this.isElderlyMode ? 280 : 200)
        .layoutWeight(1)

      Button('TimePickerDialog')
        .width(this.isElderlyMode ? '80%' : '60%')
        .height(this.isElderlyMode ? 60 : 50)
        .fontSize(this.isElderlyMode ? 18 : 16)
        .backgroundColor(this.isElderlyMode ? '#0A59F7' : '#007DFF')
        .fontColor('#FFFFFF')
        .margin(this.isElderlyMode ? 30 : 20)
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
                console.info(`适老化模式${this.isElderlyMode ? '开启' : '关闭'}，时间选择范围: 09:00:00 - 18:00:00`);
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()');
            }
          });
        })

      Text('时间选择范围: 09:00:00 - 18:00:00')
        .fontSize(this.isElderlyMode ? 18 : 14)
        .fontColor(this.isElderlyMode ? '#0A59F7' : Color.Blue)
        .fontWeight(this.isElderlyMode ? FontWeight.Medium : FontWeight.Normal)
        .margin({ top: this.isElderlyMode ? 20 : 10, bottom: this.isElderlyMode ? 30 : 20 })

      Text(this.isElderlyMode ? '适老化模式：字体更大，按钮更大，对比度更高' : '说明: 适老化适配，时间选择范围保持不变')
        .fontSize(this.isElderlyMode ? 16 : 12)
        .fontColor(this.isElderlyMode ? '#333333' : Color.Gray)
        .textAlign(TextAlign.Center)
        .lineHeight(this.isElderlyMode ? 24 : 18)
        .margin({ bottom: this.isElderlyMode ? 30 : 20 })
    }
    .width('100%')
    .height('100%')
    .padding(this.isElderlyMode ? 30 : 20)
    .backgroundColor(this.isElderlyMode ? '#FAFAFA' : '#FFFFFF')
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}