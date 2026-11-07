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
import { window } from '@kit.ArkUI'

@CustomDialog
struct CustomDialog0360 {
  controller: CustomDialogController
  onConfirm: () => void = () => {}

  build() {
    Column() {
      Text('CustomDialog弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('验证横竖屏切换对Z序的影响')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('确定')
        .id('zindex_menubar_0360_dialog_confirm')
        .onClick(() => {
          this.onConfirm()
          this.controller.close()
        })
        .margin(10)
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@Entry
@Component
struct ZindexMenubar0360 {
  @State dialogClickResult: string = ''
  @State isPopupVisible: boolean = false
  @State orientationText: string = '当前方向: 竖屏'

  customDialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog0360({
      onConfirm: () => {
        this.dialogClickResult = 'CustomDialog确定按钮被点击'
      }
    }),
    autoCancel: false
  })

  aboutToAppear() {
    this.showMultipleDialogs()
  }

  showMultipleDialogs() {
    // 显示Toast
    promptAction.showToast({
      message: '验证横竖屏切换对Z序的影响',
      duration: 3000
    })

    // 显示Popup
    this.isPopupVisible = true

    // 显示CustomDialog
    setTimeout(() => {
      this.customDialogController.open()
    }, 300)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0360')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('横竖屏切换 Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Text(this.orientationText)
        .id('zindex_menubar_0360_orientation')
        .fontSize(14)
        .fontColor(Color.Orange)
        .margin({ bottom: 10 })

      Button('打开各种弹框')
        .id('zindex_menubar_0360_open')
        .onClick(() => {
          this.showMultipleDialogs()
        })
        .margin(10)

      Button('Popup触发按钮')
        .id('zindex_menubar_0360_popup')
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
        .id('zindex_menubar_0360_menu')
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
        .id('zindex_menubar_0360_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0360_result')
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

