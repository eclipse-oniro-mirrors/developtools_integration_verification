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

import { UIContext, PromptAction } from '@kit.ArkUI'

@Entry
@Component
struct ZindexMenubar0280 {
  @State dialogClickResult: string = ''
  private uiContext: UIContext | null = null
  private promptAction: PromptAction | null = null

  aboutToAppear() {
    this.uiContext = this.getUIContext()
    if (this.uiContext) {
      this.promptAction = this.uiContext.getPromptAction()
      this.showAlertDialog()
    }
  }

  showAlertDialog() {
    if (this.promptAction) {
      this.promptAction.showDialog({
        title: '提示',
        message: '验证UIContext拉起alertdialog组件Z序在menuBar之下',
        buttons: [
          {
            text: '取消',
            color: '#666666'
          },
          {
            text: '确定',
            color: '#007DFF'
          }
        ]
      }).then((result) => {
        if (result.index === 0) {
          this.dialogClickResult = 'AlertDialog取消按钮被点击'
        } else if (result.index === 1) {
          this.dialogClickResult = 'AlertDialog确定按钮被点击'
        }
      }).catch((err: Error) => {
        this.dialogClickResult = 'AlertDialog取消'
      })
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0280')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('UIContext拉起AlertDialog Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开AlertDialog')
        .id('zindex_menubar_0280_open')
        .onClick(() => {
          this.showAlertDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0280_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0280_result')
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

