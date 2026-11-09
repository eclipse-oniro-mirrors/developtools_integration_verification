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
struct UiComponentButtonButtonRadius08 {
  private selectedDate: Date = new Date();
  private selectTime: Date = new Date('2025-8-25T08:30:00')
  @State text : string = 'TextPickerDialog set all button type to default'
  private select: number | number[] = 0
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']
  @State v:string = '';

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

      Button('TextPickerDialog:' + this.v)
        .id('UiComponentButtonButtonRadius08_01')
        .margin(20)
        .labelStyle({
          overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 20,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: 900,
            family: 'cursive',
            style: FontStyle.Italic,
          }
        })
        .onClick(() => {
          this.getUIContext().showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            disappearTextStyle: {color: Color.Red, font: {size: 15, weight: FontWeight.Lighter}},
            textStyle: {color: Color.Black, font: {size: 20, weight: FontWeight.Normal}},
            selectedTextStyle: {color: Color.Blue, font: {size: 30, weight: FontWeight.Bolder}},
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
            onAccept: (value: TextPickerResult) => {
              this.select = value.index
              console.log(this.select + '')
              this.v = value.value as string
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value))
            },
            onCancel: () => {
              console.info('TextPickerDialog:onCancel()')
            },
            onChange: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onChange()' + JSON.stringify(value))
            },
            onScrollStop: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value))
            },
            onDidAppear: () => {
              console.info('TextPickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('TextPickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('TextPickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('TextPickerDialog:onWillDisappear()')
            }
          })
        })
    }
    .width('100%')
  }
}