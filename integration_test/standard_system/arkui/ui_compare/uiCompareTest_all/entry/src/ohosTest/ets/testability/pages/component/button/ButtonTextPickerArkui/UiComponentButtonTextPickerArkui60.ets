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
struct UiComponentButtonTextPickerArkui60 {
  private selectedDate: Date = new Date();
  @State text : string = 'CalendarPicker set textStyle font to undefined'

  build() {
    Column() {
      Text(this.text)
        .width('80%')
        .height('30%')
        .padding(3)
        .ellipsisMode(EllipsisMode.END)
        .fontSize(10)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Black)
        .lineHeight(20)
        .fontWeight(FontWeight.Bolder)
        .textAlign(TextAlign.Center)
        .decoration({
          type: TextDecorationType.Underline,
          color:Color.Black
        })
        .margin({
          top:1,
          bottom:20,
          left:1,
          right:1
        })
        .borderWidth(1)

      Text('set font to undefined')
        .fontSize(20)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .edgeAlign(CalendarAlign.START)
        .id('UiComponentButtonTextPickerArkui60_01')
        .textStyle(
          {
            color: Color.Red,
            font: {
              size: undefined,
              weight: FontWeight.Normal
            }
          })
        .margin(10)
        .onChange((value) => {
          this.text = JSON.stringify(value)
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })

      Text('set font to 20')
        .fontSize(20)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .edgeAlign(CalendarAlign.START)
        .id('UiComponentButtonTextPickerArkui60_02')
        .textStyle(
          {
            color: Color.Red,
            font: {
              size: 20,
              weight: FontWeight.Normal
            }
          })
        .margin(10)
        .onChange((value) => {
          this.text = JSON.stringify(value)
          console.info('CalendarPicker onChange:' + JSON.stringify(value))
        })
    }
    .width('100%')
  }
}
