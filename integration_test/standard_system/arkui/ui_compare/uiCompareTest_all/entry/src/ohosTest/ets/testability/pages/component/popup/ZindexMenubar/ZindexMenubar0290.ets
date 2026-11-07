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
struct ZindexMenubar0290 {
  @State dialogClickResult: string = ''
  @State isSheetVisible: boolean = true

  @Builder
  SheetBuilder() {
    Column() {
      Text('BindSheet弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('验证UIContext拉起bindsheet组件Z序在menuBar之下')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('确定')
        .id('zindex_menubar_0290_confirm')
        .onClick(() => {
          this.dialogClickResult = 'BindSheet确定按钮被点击'
          this.isSheetVisible = false
        })
        .margin(10)
    }
    .width('100%')
    .padding(20)
  }

  aboutToAppear() {
    // 页面加载时自动显示BindSheet
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0290')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('UIContext拉起BindSheet Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开BindSheet')
        .id('zindex_menubar_0290_open')
        .onClick(() => {
          this.isSheetVisible = true
        })
        .margin(10)
        .bindSheet($$this.isSheetVisible, this.SheetBuilder(), {
          height: 300,
          dragBar: true,
          showClose: true
        })

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0290_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0290_result')
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

