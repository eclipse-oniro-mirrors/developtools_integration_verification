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
struct UiComponentButtonButtonRadius05 {
  private selectedDate: Date = new Date();
  @State text : string = 'CalendarPickerDialog set all button type to default'

  build() {
    Column() {
      Text(this.text)
        .width('80%')
        .height('20%')
        .padding(3)
        .id('UiComponentButtonButtonRadius05_01')
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

      Button('Show CalendarPicker Dialog')
        .margin(20)
        .controlSize(ControlSize.NORMAL)
        .id('UiComponentButtonButtonRadius05_02')
        .type(ButtonType.Capsule)
        .width('50%')
        .borderRadius(5)
        .height('20%')
        .fontWeight(FontWeight.Bolder)
        .backgroundColor(Color.Blue)
        .onClick(()=>{
          console.log('onclick success')
        })
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 2,
          maxFontSize: 20,
          font: {
            size: 10,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .fontSize(2)
        .onClick(() => {
          console.info('CalendarDialog.show');
          CalendarPickerDialog.show({
            selected: this.selectedDate,
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
            onAccept: (value) => {
              this.text = JSON.stringify(value)
              this.selectedDate = value;
              console.info('calendar onAccept:' + JSON.stringify(value));
            },
            onCancel: () => {
              console.info('calendar onCancel');
            },
            onChange: (value) => {
              console.info('calendar onChange:' + JSON.stringify(value));
            },
            onDidAppear: () => {
              console.info('calendar onDidAppear');
            },
            onDidDisappear: () => {
              console.info('calendar onDidDisappear');
            },
            onWillAppear: () => {
              console.info('calendar onWillAppear');
            },
            onWillDisappear: () => {
              console.info('calendar onWillDisappear');
            }
          });
        })
    }
    .width('100%')
  }
}
