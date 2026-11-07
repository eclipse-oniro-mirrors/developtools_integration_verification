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

import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ZindexMenubar0110 {
  @State dialogClickResult: string = ''

  aboutToAppear() {
    this.showDialog()
  }

  showDialog() {
    promptAction.showDialog({
      title: '提示',
      message: '验证dialog组件Z序在menuBar之下',
      showInSubWindow: false,
      buttons: [
        {
          text: '取消',
          color: '#000000'
        },
        {
          text: '确定',
          color: '#317aff'
        }
      ]
    }).then((result) => {
      if (result.index === 0) {
        this.dialogClickResult = 'Dialog取消按钮被点击'
      } else {
        this.dialogClickResult = 'Dialog确定按钮被点击'
      }
    }).catch((err: Error) => {
      this.dialogClickResult = 'Dialog关闭'
    })
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0110')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('showInSubWindow=false, Dialog')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开Dialog')
        .id('zindex_menubar_0110_open')
        .onClick(() => {
          this.showDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0110_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0110_result')
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

