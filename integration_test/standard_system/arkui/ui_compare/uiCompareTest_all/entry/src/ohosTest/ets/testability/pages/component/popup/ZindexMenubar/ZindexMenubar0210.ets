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
struct ZindexMenubar0210 {
  @State dialogClickResult: string = ''
  @State selectedTime: Date = new Date('2024-01-01T10:30:00')

  aboutToAppear() {
    this.showTimePickerDialog()
  }

  showTimePickerDialog() {
    TimePickerDialog.show({
      selected: this.selectedTime,
      useMilitaryTime: true,
      onAccept: (value: TimePickerResult) => {
        this.dialogClickResult = `TimePickerDialog确定: ${value.hour}:${value.minute}`
      },
      onCancel: () => {
        this.dialogClickResult = 'TimePickerDialog取消'
      },
      onChange: (value: TimePickerResult) => {
        this.dialogClickResult = `时间改变: ${value.hour}:${value.minute}`
      }
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0210')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, TimePickerDialog')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开TimePickerDialog')
        .id('zindex_menubar_0210_open')
        .onClick(() => {
          this.showTimePickerDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0210_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0210_result')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}

