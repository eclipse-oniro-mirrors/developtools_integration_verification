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

@Entry
@Component
struct UIComponentButtonTextPickerArkUI028 {
  private selectedTime: Date = new Date('2025-07-10T09:10:10');
  private caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0660';

  build() {
    Column() {
      Column() {
        Text(`dateTimeOptions：{hour: "2-digit", minute: "2-digit", second: "2-digit"}`)
          .fontSize(20)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
          .margin(10)
      }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfffaCC)
      Column() {
        TimePicker({
          selected: this.selectedTime
        })
          .id('timepicker')
          .dateTimeOptions({hour: '2-digit', minute: '2-digit', second: '2-digit'})
          .useMilitaryTime(false)
          .loop(false)
          .onChange((value: TimePickerResult) => {
            if (value.hour >= 0) {
              this.selectedTime.setHours(value.hour, value.minute);
              console.info(this.caseName + 'select current date is: ' + JSON.stringify(value));
            }
          })
      }.width('100%').height('70%')
    }
  }
}
