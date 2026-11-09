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
struct MediaTimepickerStartEndTime0018 {
  private selectTime: Date = new Date('2024-12-20T09:30:00');
  @State selectedTimeText: string = '09:30:00 AM';

  build() {
    Column() {
      TimePicker({
        selected: this.selectTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND,
        start: new Date('2024-12-20T00:00:00'),
        end: new Date('2024-12-20T11:59:59')
      })
        .dateTimeOptions({ hour: 'numeric', minute: '2-digit', second: '2-digit', hour12: true })
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectTime.setHours(value.hour, value.minute, value.second);
            const period = value.hour < 12 ? 'AM' : 'PM';
            const displayHour = value.hour === 0 ? 12 : (value.hour > 12 ? value.hour - 12 : value.hour);
            this.selectedTimeText = `${displayHour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')} ${period}`;
            console.info('TimePicker选择时间: ' + JSON.stringify(value));
            console.info('完整上午时间段，显示12:00:00 AM - 11:59:59 AM');
          }
        })

      Button('TimePickerDialog')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: false,
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE_SECOND,
            start: new Date('2024-12-20T00:00:00'),
            end: new Date('2024-12-20T11:59:59'),
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined && value.second != undefined) {
                this.selectTime.setHours(value.hour, value.minute, value.second);
                const period = value.hour < 12 ? 'AM' : 'PM';
                const displayHour = value.hour === 0 ? 12 : (value.hour > 12 ? value.hour - 12 : value.hour);
                this.selectedTimeText = `${displayHour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')} ${period}`;
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value));
                console.info('完整上午时间段，显示12:00:00 AM - 11:59:59 AM');
              }
            }
          });
        })
    }.width('100%')
  }
}
