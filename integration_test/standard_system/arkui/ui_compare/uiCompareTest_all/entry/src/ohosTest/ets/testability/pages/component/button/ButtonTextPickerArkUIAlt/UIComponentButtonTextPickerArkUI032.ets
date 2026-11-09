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
struct UIComponentButtonTextPickerArkUI032 {
  private selectedDate: Date = new Date('2025-07-10');
  private caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0540';

  build() {
    Column() {
      Column() {
        Text(`textStyle:undefined`)
          .fontSize(20)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
          .margin(10)
      }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfffaCC)
      Column() {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        })
          .id('datapicker')
          .selectedTextStyle({color: Color.Blue, font: {size: 15, weight: FontWeight.Normal}})
          .lunar(false)
          .onDateChange((value: Date) => {
            this.selectedDate = value;
            console.info(this.caseName + 'select current date is: ' + value.toString());
          })
      }.width('100%').height('70%')
    }
  }
}
