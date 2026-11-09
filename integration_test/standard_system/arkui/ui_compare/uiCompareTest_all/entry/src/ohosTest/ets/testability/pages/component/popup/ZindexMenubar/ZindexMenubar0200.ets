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
struct ZindexMenubar0200 {
  @State dialogClickResult: string = ''
  private textPickerOptions: string[] = ['选项一', '选项二', '选项三', '选项四', '选项五']
  @State selectedIndex: number = 0

  aboutToAppear() {
    this.showTextPickerDialog()
  }

  showTextPickerDialog() {
    TextPickerDialog.show({
      range: this.textPickerOptions,
      selected: this.selectedIndex,
      onAccept: (value: TextPickerResult) => {
        this.dialogClickResult = `TextPickerDialog确定: ${value.value}`
        this.selectedIndex = value.index as number
      },
      onCancel: () => {
        this.dialogClickResult = 'TextPickerDialog取消'
      },
      onChange: (value: TextPickerResult) => {
        this.dialogClickResult = `选项改变: ${value.value}`
      }
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0200')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, TextPickerDialog')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开TextPickerDialog')
        .id('zindex_menubar_0200_open')
        .onClick(() => {
          this.showTextPickerDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0200_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0200_result')
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

