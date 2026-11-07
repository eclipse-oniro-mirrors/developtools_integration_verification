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
struct MediaTimepickerEnableCascade0067 {
  private selectedTime1: Date = new Date('2022-07-22T08:00:00');
  private selectedTime2: Date = new Date('2022-07-22T10:00:00');
  @State enableCascadeValue: boolean = false;
  @State showModifierPage: boolean = false;

  build() {
    Column() {
      Button('modifierPage')
        .margin(20)
        .onClick(() => {
          this.showModifierPage = !this.showModifierPage;
        })

      if (this.showModifierPage) {
        Column() {
          Button('切换enableCascade值-false')
            .margin(20)
            .onClick(() => {
              this.enableCascadeValue = false;
              console.info('enableCascade set to: ' + this.enableCascadeValue);
            })

          Text('第一个TimePicker')
            .fontSize(16)
            .margin(10)

          TimePicker({
            selected: this.selectedTime1,
          })
            .enableCascade(false)
            .loop(true)
            .onChange((value: TimePickerResult) => {
              if (value.hour >= 0) {
                this.selectedTime1.setHours(value.hour, value.minute);
                console.info('TimePicker1 select current date is: ' + JSON.stringify(value));
              }
            })

          Text('第二个TimePicker (用于测试)')
            .fontSize(16)
            .margin(10)

          TimePicker({
            selected: this.selectedTime2,
          })
            .enableCascade(this.enableCascadeValue)
            .loop(true)
            .onChange((value: TimePickerResult) => {
              if (value.hour >= 0) {
                this.selectedTime2.setHours(value.hour, value.minute);
                console.info('TimePicker2 select current date is: ' + JSON.stringify(value));
              }
            })
        }
      }
    }.width('100%')
  }
}
