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

import { i18n } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentButtonButtonRadius06 {
  private selectedDate: Date = new Date();
  private selectTime: Date = new Date('2025-8-25T08:30:00')
  @State text : string = 'TimePickerDialog set all button type to default'

  build() {
    Column() {
      Text(this.text)
        .width('80%')
        .height('20%')
        .padding(3)
        .ellipsisMode(EllipsisMode.END)
        .fontSize(5)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .lineHeight(20)
        .fontWeight(FontWeight.Bolder)
        .textAlign(TextAlign.Center)
        .decoration({
          type: TextDecorationType.Underline,
          color:Color.Black
        })
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
        .borderWidth(1)

      Button('TimePickerDialog 12小时制')
        .margin(20)
        .id('UiComponentButtonButtonRadius06_01')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            acceptButtonStyle: {
              style: ButtonStyleMode.NORMAL,
              role: ButtonRole.NORMAL,
              fontColor: 'rgb(81, 81, 216)',
              fontSize: '26fp',
              fontWeight: FontWeight.Bolder,
              fontStyle: FontStyle.Normal,
              fontFamily: 'sans-serif',
              backgroundColor: '#A6ACAF',
            },
            cancelButtonStyle: {
              style: ButtonStyleMode.NORMAL,
              role: ButtonRole.NORMAL,
              fontColor: Color.Blue,
              fontSize: '16fp',
              fontWeight: FontWeight.Normal,
              fontStyle: FontStyle.Italic,
              fontFamily: 'sans-serif',
              backgroundColor: '#50182431',
            },
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TimePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TimePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TimePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TimePickerDialog:onWillDisappear()')
            }
          })
        })

      Button('TimePickerDialog 24小时制')
        .margin(20)
        .id('UiComponentButtonButtonRadius06_02')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectTime,
            useMilitaryTime: true,
            acceptButtonStyle: {
              style: ButtonStyleMode.NORMAL,
              role: ButtonRole.NORMAL,
              fontColor: 'rgb(81, 81, 216)',
              fontSize: '26fp',
              fontWeight: FontWeight.Bolder,
              fontStyle: FontStyle.Normal,
              fontFamily: 'sans-serif',
              backgroundColor: '#A6ACAF',
            },
            cancelButtonStyle: {
              style: ButtonStyleMode.NORMAL,
              role: ButtonRole.NORMAL,
              fontColor: Color.Blue,
              fontSize: '16fp',
              fontWeight: FontWeight.Normal,
              fontStyle: FontStyle.Italic,
              fontFamily: 'sans-serif',
              backgroundColor: '#50182431',
            },
            disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectTime.setHours(value.hour, value.minute)
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value))
              }
            },
            onCancel: () => {
              console.info('TimePickerDialog:onCancel()')
            },
            onChange: (value: TimePickerResult) => {
              console.info('TimePickerDialog:onChange()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TimePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TimePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TimePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TimePickerDialog:onWillDisappear()')
            }
          })
        })
    }
    .width('100%')
  }
}