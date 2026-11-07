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

import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct ZindexMenubar0350 {
  @State dialogClickResult: string = ''

  aboutToAppear() {
    this.showToast()
  }

  showToast() {
    // TopMost模式下创建并显示toast
    promptAction.showToast({
      message: '验证TopMost模式下toast的Z序在menuBar之下',
      duration: 5000,
      bottom: 200
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0350')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('TopMost模式下Toast Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('显示Toast')
        .id('zindex_menubar_0350_open')
        .onClick(() => {
          this.showToast()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0350_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0350_result')
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

