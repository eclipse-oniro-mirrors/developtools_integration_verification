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
struct ZindexMenubar0180 {
  @State dialogClickResult: string = ''
  @State selectedDate: Date = new Date('2024-06-15')

  aboutToAppear() {
    this.showDatePickerDialog()
  }

  showDatePickerDialog() {
    DatePickerDialog.show({
      start: new Date('2000-01-01'),
      end: new Date('2100-12-31'),
      selected: this.selectedDate,
      onAccept: (value: DatePickerResult) => {
        this.dialogClickResult = `DatePickerDialog确定: ${value.year}-${(value.month ?? 0) + 1}-${value.day}`
      },
      onCancel: () => {
        this.dialogClickResult = 'DatePickerDialog取消'
      },
      onChange: (value: DatePickerResult) => {
        this.dialogClickResult = `日期改变: ${value.year}-${(value.month ?? 0) + 1}-${value.day}`
      }
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0180')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, DatePickerDialog')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开DatePickerDialog')
        .id('zindex_menubar_0180_open')
        .onClick(() => {
          this.showDatePickerDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0180_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0180_result')
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

