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
struct UIComponentMediaDatePickerMode0010 {
  @State name: string = 'UIComponentMediaDatePickerMode0010';
  @State message: string = 'UIComponentMediaDatePickerMode0010';
  private selectedDate: Date = new Date('2025-01-15');
  private startDate: Date = new Date('2025-01-05');
  private endDate: Date = new Date('2025-01-25');
  @State lunarFlag: boolean = false;

  build() {
    Column() {
      Column() {
        Text(this.message + '\nlunar: ' + JSON.stringify(this.lunarFlag))
          .margin(10)

        Button('Switch lunar')
          .margin(5)
          .id(this.name + '_01')
          .onClick(() => {
            this.lunarFlag = !this.lunarFlag;
          })

        Text('DatePickerMode: DATE')
        DatePicker({
          mode: DatePickerMode.DATE,
          selected: this.selectedDate,
          start: this.startDate,
          end: this.endDate
        })
          .lunar(this.lunarFlag)
          .margin(5)

        Text('DatePickerMode: 0')
        DatePicker({
          mode: 0,
          selected: this.selectedDate,
          start: this.startDate,
          end: this.endDate
        })
          .lunar(this.lunarFlag)
          .margin(5)


        Button('Show DatePicker dialog with DatePickerMode: DATE')
          .margin(10)
          .id(this.name + '_02')
          .onClick(() => {
            console.info('DatePickerDialog.show with DatePickerMode: DATE');
            this.getUIContext().showDatePickerDialog({
              mode: DatePickerMode.DATE,
              start: this.startDate,
              end: this.endDate,
              selected: this.selectedDate,
            })
          })
        Button('Show DatePicker dialog with DatePickerMode: 0')
          .margin(10)
          .id(this.name + '_03')
          .onClick(() => {
            console.info('DatePickerDialog.show with DatePickerMode: 0');
            this.getUIContext().showDatePickerDialog({
              mode: 0,
              start: this.startDate,
              end: this.endDate,
              selected: this.selectedDate,
            })
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}