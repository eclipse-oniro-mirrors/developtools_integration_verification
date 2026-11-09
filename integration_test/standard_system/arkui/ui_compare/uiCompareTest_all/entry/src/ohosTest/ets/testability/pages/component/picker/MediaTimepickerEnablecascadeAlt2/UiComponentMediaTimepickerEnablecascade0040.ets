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
struct UiComponentMediaTimepickerEnablecascade0040 {
  @State isMilitaryTime:boolean =true;
  @State private selectedTime: Date = new Date('2022-07-22T17:00:00');
  build() {
    Row() {
      Column() {
        Button('TimePickerDialog 12小时制')
          .id('UiComponentMediaTimepickerEnablecascade0040_001')
          .margin(20)
          .onClick(() => {
            TimePickerDialog.show({ // 建议使用 this.getUIContext().showTimePickerDialog()接口
              selected: this.selectedTime,
              useMilitaryTime:false,
              disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
              textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
              selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
              onAccept: (value: TimePickerResult) => {
                // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
                if (value.hour != undefined && value.minute != undefined) {
                  this.selectedTime.setHours(value.hour, value.minute)
                  console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
                }
              },
              onCancel: () => {
                console.info('TimePickerDialog:onCancel()')
              },
              onChange: (value: TimePickerResult) => {
                console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
              },
              onDidAppear: () => {
                console.info('TimePickerDialog:onDidAppear()')
              },
              onDidDisappear: () => {
                console.info('TimePickerDialog:onDidDisappear()')
              },
              onWillAppear: () => {
                console.info('TimePickerDialog:onWillAppear()')
              },
              onWillDisappear: () => {
                console.info('TimePickerDialog:onWillDisappear()')
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
