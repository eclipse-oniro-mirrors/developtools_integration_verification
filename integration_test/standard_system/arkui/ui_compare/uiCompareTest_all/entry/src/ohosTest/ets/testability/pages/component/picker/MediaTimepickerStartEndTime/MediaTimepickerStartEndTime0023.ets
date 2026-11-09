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
struct MediaTimepickerStartEndTime0023 {
  private selectTime: Date = new Date('2024-12-20T12:30:00');
  @State selectedTimeText: string = '12:30:00';

  build() {
    Column() {
      TimePicker({
        selected: this.selectTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND,
        start: new Date('2024-12-20T09:00:00'),
        end: new Date('2024-12-20T18:00:00')
      })
        .dateTimeOptions({ hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false })
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectTime.setHours(value.hour, value.minute, value.second);
            this.selectedTimeText = `${value.hour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')}`;
            console.info('TimePicker选择时间: ' + JSON.stringify(value));
            console.info('选中时间在起始时间(09:00:00)与结束时间(18:00:00)之间，可正常选中');
          }
        })

      Button('TimePickerDialog')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: true,
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE_SECOND,
            start: new Date('2024-12-20T09:00:00'),
            end: new Date('2024-12-20T18:00:00'),
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined && value.second != undefined) {
                this.selectTime.setHours(value.hour, value.minute, value.second);
                this.selectedTimeText = `${value.hour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')}`;
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value));
                console.info('选中时间在起始时间(09:00:00)与结束时间(18:00:00)之间，可正常选中');
              }
            }
          });
        })
    }.width('100%')
  }
}