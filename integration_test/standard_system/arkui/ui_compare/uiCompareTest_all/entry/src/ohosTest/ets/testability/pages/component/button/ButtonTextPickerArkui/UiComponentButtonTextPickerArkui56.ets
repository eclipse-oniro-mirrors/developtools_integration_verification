/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct UiComponentButtonTextPickerArkui56 {
  @State isLunar: boolean = true;
  @State datePickerModeList: (DatePickerMode)[] = [
    DatePickerMode.DATE,
    DatePickerMode.YEAR_AND_MONTH,
    DatePickerMode.MONTH_AND_DAY,
  ];
  @State datePickerModeIndex: number = 0;
  @State text :string = 'DatePicker set lunar to undefined'
  private selectedDate: Date = new Date('2025-01-15');

  build() {
    Column() {
      Button('切换公历农历')
        .margin({ top: 30, bottom: 30 })
        .onClick(() => {
          this.isLunar = !this.isLunar;
        })
        .type(ButtonType.ROUNDED_RECTANGLE)
        .backgroundColor(0x317aff)
        .width(180)
        .labelStyle({
          overflow:TextOverflow.Ellipsis,
          maxLines:3, minFontSize: 0
        })

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate,
        mode: this.datePickerModeList[this.datePickerModeIndex]
      })
        .disappearTextStyle({
          color: Color.Blue,
          font:
          { size: '16fp', weight: FontWeight.Bold }
        })
        .textStyle({
          color: '#ff182431',
          font: { size: '18fp', weight: FontWeight.Normal }
        })
        .lunar(undefined)
        .onDateChange((value: Date) => {
          this.selectedDate = value;
          console.info('select current date is: ' + value.toString());
        })

      Text(this.text)
        .height(80)
        .fontSize(10)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .lineHeight(10)
        .fontWeight(300)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
    .width('100%')
  }
}