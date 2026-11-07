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
struct ZindexMenubar0120 {
  @State dialogClickResult: string = ''

  aboutToAppear() {
    this.showAlertDialog()
  }

  showAlertDialog() {
    AlertDialog.show({
      title: '提示',
      message: '验证alertdialog组件Z序在menuBar之下',
      autoCancel: false,
      showInSubWindow: true,
      alignment: DialogAlignment.TopStart,
      offset: { dx: 50, dy: 300 },
      confirm: {
        value: '确定',
        action: () => {
          this.dialogClickResult = 'AlertDialog确定按钮被点击'
        }
      },
      cancel: () => {
        this.dialogClickResult = 'AlertDialog取消'
      }
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0120')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, placement=TopStart')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开AlertDialog')
        .id('zindex_menubar_0120_open')
        .onClick(() => {
          this.showAlertDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0120_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0120_result')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
    .margin(30)
  }
}

