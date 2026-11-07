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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentMediaCalendarPickerDate0010 {
  @State name: string = 'UIComponentMediaCalendarPickerDate0010';
  @State message: string = 'UIComponentMediaCalendarPickerDate0010';
  private selectedDate: Date = new Date('2025-01-15');
  private startDate: Date = new Date('2025-01-05');
  private endDate: Date = new Date('2025-01-25');

  build() {
    Column() {
      Column() {
        Text(this.message)
          .margin(10)

        CalendarPicker({
          hintRadius: 10,
          selected: this.selectedDate,
          start: this.startDate,
          end: this.endDate
        })
          .edgeAlign(CalendarAlign.END)
          .textStyle({
            color: '#ff182431',
            font: {
              size: 20,
              weight: FontWeight.Normal
            }
          })
          .margin(10)
          .id(this.name + '_01')
          .onChange((value) => {
            this.message += '\nCalendarPicker onChange:' + JSON.stringify(value);
          })

        Button('Show CalendarPicker Dialog')
          .margin({ top: 500 })
          .id(this.name + '_02')
          .onClick(() => {
            console.info('CalendarDialog.show');
            CalendarPickerDialog.show({
              start: this.startDate,
              end: this.endDate,
              selected: this.selectedDate,
              onChange: (value) => {
                this.message += '\nCalendarPickerDialog onChange:' + JSON.stringify(value);
              }
            })
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}