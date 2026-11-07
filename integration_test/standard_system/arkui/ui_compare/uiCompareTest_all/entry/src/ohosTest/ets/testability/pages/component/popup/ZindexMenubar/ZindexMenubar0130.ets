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

@CustomDialog
struct CustomDialogMenubar0130 {
  controller: CustomDialogController
  onConfirm: () => void = () => {}

  build() {
    Column() {
      Text('CustomDialog弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('验证CustomDialog组件Z序在menuBar之下')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('确定')
        .id('zindex_menubar_0130_confirm')
        .onClick(() => {
          this.onConfirm()
          this.controller.close()
        })
        .margin(10)
    }
    .padding(20)
  }
}

@Entry
@Component
struct ZindexMenubar0130 {
  @State dialogClickResult: string = ''

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogMenubar0130({
      onConfirm: () => {
        this.dialogClickResult = 'CustomDialog确定按钮被点击'
      }
    }),
    showInSubWindow: true,
    alignment: DialogAlignment.TopStart,
    offset: { dx: 50, dy: 300 },
    autoCancel: false
  })

  aboutToAppear() {
    setTimeout(() => {
      this.dialogController.open()
    }, 500)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0130')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=true, placement=TopStart')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开CustomDialog')
        .id('zindex_menubar_0130_open')
        .onClick(() => {
          this.dialogController.open()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0130_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0130_result')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
    .margin(20)
  }
}

