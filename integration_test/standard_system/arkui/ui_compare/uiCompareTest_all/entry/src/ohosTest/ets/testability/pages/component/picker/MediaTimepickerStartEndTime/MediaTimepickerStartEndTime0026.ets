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
struct MediaTimepickerStartEndTime0026 {
  private selectTime: Date = new Date(); // 未设置具体时间，使用当前时间
  @State selectedTimeText: string = '';

  aboutToAppear() {
    // 获取当前时间并显示
    const now = new Date();
    this.selectedTimeText = `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}:${now.getSeconds().toString().padStart(2, '0')}`;
  }

  build() {
    Column() {
      TimePicker({
        selected: this.selectTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND,
        start: new Date(Date.now() + 2 * 60 * 60 * 1000), // 当前时间+2小时作为起始时间
        end: new Date(Date.now() + 8 * 60 * 60 * 1000)    // 当前时间+8小时作为结束时间
      })
        .dateTimeOptions({ hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false })
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectTime.setHours(value.hour, value.minute, value.second);
            this.selectedTimeText = `${value.hour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')}`;
            console.info('TimePicker选择时间: ' + JSON.stringify(value));
            console.info('选中时间未设置，起始时间晚于当前系统时间，选中时间应为起始时间');
          }
        })

      Button('TimePickerDialog')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: true,
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE_SECOND,
            start: new Date(Date.now() + 2 * 60 * 60 * 1000), // 当前时间+2小时作为起始时间
            end: new Date(Date.now() + 8 * 60 * 60 * 1000),   // 当前时间+8小时作为结束时间
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined && value.second != undefined) {
                this.selectTime.setHours(value.hour, value.minute, value.second);
                this.selectedTimeText = `${value.hour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')}`;
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value));
                console.info('选中时间未设置，起始时间晚于当前系统时间，选中时间应为起始时间');
              }
            }
          });
        })
    }.width('100%')
  }
}
