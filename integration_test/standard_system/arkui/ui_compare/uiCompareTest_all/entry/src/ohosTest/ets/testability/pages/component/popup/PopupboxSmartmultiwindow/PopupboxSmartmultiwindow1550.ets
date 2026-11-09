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
struct PopupboxSmartmultiwindow1550 {
  @State message: string = '点击按钮打开showDialog'

  showDialog() {
    promptAction.showDialog({
      title: 'showDialog弹窗',
      message: 'UIExtension，ShowInSubWindow为true\n观察蒙层效果、组件布局和对齐状态',
      showInSubWindow: true,
      buttons: [
        {
          text: '取消',
          color: '#999999'
        },
        {
          text: '确定',
          color: '#007DFF'
        }
      ]
    }).then((result) => {
      if (result.index === 0) {
        this.message = '点击了取消'
      } else {
        this.message = '点击了确定'
      }
    }).catch((err: Error) => {
      this.message = `Dialog错误: ${err.message}`
    })
  }

  aboutToAppear() {
    setTimeout(() => {
      this.showDialog()
    }, 500)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1550')
        .id('popupbox_smartmultiwindow_1550_title')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('直板机上下分屏：showDialog组件')
        .id('popupbox_smartmultiwindow_1550_desc1')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text('UIExtension，ShowInSubWindow为true')
        .id('popupbox_smartmultiwindow_1550_desc2')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 5 })

      Text('观察蒙层效果、组件布局和对齐状态')
        .id('popupbox_smartmultiwindow_1550_desc3')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Text(this.message)
        .id('popupbox_smartmultiwindow_1550_message')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 20 })

      Button('打开showDialog')
        .id('popupbox_smartmultiwindow_1550_open')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.showDialog()
        })

      Text('预期结果：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('1、蒙层覆盖整个应用窗口')
        .id('popupbox_smartmultiwindow_1550_expect1')
        .fontSize(11)
        .margin({ bottom: 3 })

      Text('2、组件布局和对齐完全基于应用窗口进行')
        .id('popupbox_smartmultiwindow_1550_expect2')
        .fontSize(11)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(15)
  }
}

