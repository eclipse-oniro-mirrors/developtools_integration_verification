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
struct MediaTimepickerStartEndTime0034 {
  private selectedTime: Date = new Date('2024-12-20T12:30:00');
  @State orientation: string = 'portrait';

  build() {
    Column() {
      Text('横竖屏适配测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(`当前屏幕方向: ${this.orientation}`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

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
            console.info('时间选择范围: 09:00:00 - 18:00:00，横竖屏适配');
          }
        })
        .width('100%')
        .layoutWeight(1)

      Button('TimePickerDialog')
        .width('60%')
        .height(50)
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
                console.info('时间选择范围: 09:00:00 - 18:00:00，横竖屏适配');
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()');
            }
          });
        })

      Text('时间选择范围: 09:00:00 - 18:00:00')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10, bottom: 20 })

      Text('说明: 横竖屏切换时，时间选择范围保持不变')
        .fontSize(12)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.SpaceEvenly)
    .onAreaChange((oldValue: Area, newValue: Area) => {
      // 监听布局区域变化，判断屏幕方向
      if (newValue.width > newValue.height) {
        this.orientation = 'landscape';
        console.info('屏幕方向变为横屏，时间选择范围保持: 09:00:00 - 18:00:00');
      } else {
        this.orientation = 'portrait';
        console.info('屏幕方向变为竖屏，时间选择范围保持: 09:00:00 - 18:00:00');
      }
    })
  }
}