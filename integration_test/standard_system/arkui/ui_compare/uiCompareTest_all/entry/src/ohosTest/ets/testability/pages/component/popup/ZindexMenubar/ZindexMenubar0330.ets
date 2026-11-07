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
struct ZindexMenubar0330 {
  @State dialogClickResult: string = ''
  @State isPopupVisible: boolean = false

  aboutToAppear() {
    this.showMultipleDialogs()
  }

  showMultipleDialogs() {
    // 同时调起多个不同种类的弹框
    // 1. 显示Toast
    promptAction.showToast({
      message: '这是一个Toast消息',
      duration: 3000
    })

    // 2. 显示Popup
    this.isPopupVisible = true

    // 3. 显示Dialog
    setTimeout(() => {
      promptAction.showDialog({
        title: 'Dialog弹框',
        message: '验证同时调起多个不同种类的弹框的Z序情况',
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
          this.dialogClickResult = 'Dialog取消按钮被点击'
        } else if (result.index === 1) {
          this.dialogClickResult = 'Dialog确定按钮被点击'
        }
      }).catch((err: Error) => {
        this.dialogClickResult = 'Dialog取消'
      })
    }, 200)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0330')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('同时调起多个不同种类的弹框 Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('调起多个弹框')
        .id('zindex_menubar_0330_open')
        .onClick(() => {
          this.showMultipleDialogs()
        })
        .margin(10)

      Button('Popup触发按钮')
        .id('zindex_menubar_0330_popup')
        .onClick(() => {
          this.isPopupVisible = !this.isPopupVisible
        })
        .margin(10)
        .bindPopup(this.isPopupVisible, {
          message: '这是一个Popup弹框',
          placement: Placement.Bottom,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isPopupVisible = false
            }
          }
        })

      Button('菜单触发按钮')
        .id('zindex_menubar_0330_menu')
        .margin(10)
        .bindMenu([
          {
            value: '菜单选项一',
            action: () => {
              this.dialogClickResult = '菜单选项一被点击'
            }
          },
          {
            value: '菜单选项二',
            action: () => {
              this.dialogClickResult = '菜单选项二被点击'
            }
          }
        ])

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0330_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0330_result')
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

