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
struct UiComponentPopupBoxLunarSwitchStyle03 {
  selectedDate: Date = new Date('2010-1-1')
  @State text : string = '(light mode)DatePickerDialog set LunarSwitchStyle three parameters to Given color'

  build() {
    Column() {
      Text(this.text)
        .width('80%')
        .height('20%')
        .padding(3)
        .ellipsisMode(EllipsisMode.END)
        .fontSize(10)
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
          bottom:20,
          left:1,
          right:1
        })
        .padding(20)
        .borderWidth(1)

      Button('DatePickerDialog')
        .margin(20)
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            showTime:true,
            useMilitaryTime:false,
            disappearTextStyle: {color: Color.Pink, font: {size: '22fp', weight: FontWeight.Bold}},
            textStyle: {color: '#ff00ff00', font: {size: '18fp', weight: FontWeight.Normal}},
            selectedTextStyle: {color: '#ff182431', font: {size: '14fp', weight: FontWeight.Regular}},
            onDateAccept: (value: Date) => {
              this.selectedDate = value
              console.info('DatePickerDialog:onDateAccept()' + value.toString())
            },
            onCancel: () => {
              console.info('DatePickerDialog:onCancel()')
            },
            onDateChange: (value: Date) => {
              console.info('DatePickerDialog:onDateChange()' + value.toString())
            },
            onDidAppear: () => {
              console.info('DatePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('DatePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('DatePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('DatePickerDialog:onWillDisappear()')
            }
          })
        })

      Button('Lunar DatePickerDialog')
        .margin(20)
        .controlSize(ControlSize.NORMAL)
        .type(ButtonType.Capsule)
        .width('80%')
        .id('UiComponentPopupBoxLunarSwitchStyle03')
        .borderRadius(5)
        .height('20%')
        .fontWeight(FontWeight.Bolder)
        .backgroundColor(Color.Blue)
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
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            showTime: true,
            useMilitaryTime: true,
            lunarSwitch : true,
            lunarSwitchStyle:{
              selectedColor : '#ff0303',
              unselectedColor : 0x0fff03,
              strokeColor : 'rgb(0,0,255)'
            },
            lunar: true,
            disappearTextStyle: {
              color: Color.Pink,
              font:
              { size: '22fp',
                weight: FontWeight.Bold
              }
            },
            textStyle: {
              color: '#ff00ff00',
              font:
              { size: '18fp',
                weight: FontWeight.Normal
              }
            },
            selectedTextStyle: {
              color: '#ff182431',
              font:
              { size: '14fp',
                weight: FontWeight.Regular
              }
            },
            onDateAccept: (value: Date) => {
              this.selectedDate = value
              console.info('DatePickerDialog:onDateAccept()' + value.toString())
            },
            onCancel: () => {
              console.info('DatePickerDialog:onCancel()')
            },
            onDateChange: (value: Date) => {
              console.info('DatePickerDialog:onDateChange()' + value.toString())
            },
            onDidAppear: () => {
              console.info('DatePickerDialog:onDidAppear()')
            },
            onDidDisappear: () => {
              console.info('DatePickerDialog:onDidDisappear()')
            },
            onWillAppear: () => {
              console.info('DatePickerDialog:onWillAppear()')
            },
            onWillDisappear: () => {
              console.info('DatePickerDialog:onWillDisappear()')
            }
          })
        })
    }
    .width('100%')
  }
}