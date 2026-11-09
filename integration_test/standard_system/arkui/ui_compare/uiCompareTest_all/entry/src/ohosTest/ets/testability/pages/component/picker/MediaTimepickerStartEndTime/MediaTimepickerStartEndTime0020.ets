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
struct MediaTimepickerStartEndTime0020 {
  private selectTime: Date = new Date('2024-12-20T12:00:00');
  @State selectedTimeText: string = '12:00:00 PM';

  build() {
    Column() {
      TimePicker({
        selected: this.selectTime,
        format: TimePickerFormat.HOUR_MINUTE_SECOND,
        start: new Date('2024-12-20T09:00:00'),
        end: new Date('2024-12-20T15:00:00')
      })
        .dateTimeOptions({ hour: 'numeric', minute: '2-digit', second: '2-digit', hour12: true })
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectTime.setHours(value.hour, value.minute, value.second);
            const period = value.hour < 12 ? 'AM' : 'PM';
            const displayHour = value.hour === 0 ? 12 : (value.hour > 12 ? value.hour - 12 : value.hour);
            this.selectedTimeText = `${displayHour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')} ${period}`;
            console.info('TimePicker选择时间: ' + JSON.stringify(value));
            console.info('跨上下午时间段，AM和PM都可选，24小时制: ' + value.hour + ':' + value.minute + ':' + value.second);
          }
        })

      Button('TimePickerDialog')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: false,
            selected: this.selectTime,
            format: TimePickerFormat.HOUR_MINUTE_SECOND,
            start: new Date('2024-12-20T09:00:00'),
            end: new Date('2024-12-20T15:00:00'),
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined && value.second != undefined) {
                this.selectTime.setHours(value.hour, value.minute, value.second);
                const period = value.hour < 12 ? 'AM' : 'PM';
                const displayHour = value.hour === 0 ? 12 : (value.hour > 12 ? value.hour - 12 : value.hour);
                this.selectedTimeText = `${displayHour.toString().padStart(2, '0')}:${value.minute.toString().padStart(2, '0')}:${value.second.toString().padStart(2, '0')} ${period}`;
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value));
                console.info('跨上下午时间段，AM和PM都可选，24小时制: ' + value.hour + ':' + value.minute + ':' + value.second);
              }
            }
          });
        })
    }.width('100%')
  }
}
